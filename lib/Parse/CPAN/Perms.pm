# ABSTRACT: Parse 06perms.txt.gz

package Parse::CPAN::Perms;

#-----------------------------------------------------------------------------

# VERSION

#-----------------------------------------------------------------------------

use Moose;
use IO::Zlib;
use Carp qw(croak);

#-----------------------------------------------------------------------------

has permsfile => (
	is        => 'ro',
	isa       => 'Str',
	required  => 1,
);


has perms => (
	is        => 'ro',
	isa       => 'HashRef',
	builder   => '_build_perms',
);

#-----------------------------------------------------------------------------

around BUILDARGS => sub {
	my ($orig, $class)  = (shift, shift);

        return $class->$orig(@_) unless @_ %2 or ref $_[0] eq 'HASH';

        my $path = shift;
        my $arg = -f $path ? $path : "$path/modules/06perms.txt.gz";

   	return {permsfile => $arg, @_};
 };

#-----------------------------------------------------------------------------

sub _build_perms {
	my ($self) = @_;

	my $permsfile = $self->permsfile;

    my $fh = IO::Zlib->new( $permsfile, "rb" );
    croak "Failed to read $permsfile: $!" unless $fh;
    my $perms_data = $self->__read_perms($fh);
    $fh->close;

    return $perms_data;
}

#-----------------------------------------------------------------------------

sub __read_perms {
	my ($self, $fh) = @_;

	my $inheader = 1;
	my $perms = {};

    while (<$fh>) {

        if ($inheader) {
            $inheader = 0 if not m/ \S /x;
            next;
        }

    	chomp;
        my ($module, $author, $perm) = split m/\s* , \s*/x;
    	$perms->{$module}->{$author} = $perm;
    }

    return $perms;
}

#-----------------------------------------------------------------------------

sub is_authorized {
    my ( $self, $author, $module ) = @_;

    return 0 unless $author && $module;

    my $perms = $self->perms;

    return 1 if not exists $perms->{$module}; # Old mods may not have perms
    return 1 if exists $perms->{$module}->{$author};
    return 0;
}

#-----------------------------------------------------------------------------
1;

__END__

=pod

=head1 SYNOPSIS

  # Construction
  my $perms = Parse::CPAN::Perms->new('path/to/06perms.txt.gz');

  # Get all perms data as hash ref
  my $perms_data = $perms->perms;

  # Boolean convenience method
  $perms->is_authorized(AUTHOR => 'Package::Name');

=head1 DESCRIPTION

!! THIS MODULE IS EXPERIMENTAL.  INTERFACE IS SUBJECT TO CHANGE !!

This module parses the F<06perms.txt.gz> file from a CPAN-like repository.
At this time, it only parses the compressed form and it provides no mechanism
for adding new permissions or writing the data back out to a file.  If you
desire those features, please contact the author.

=head1 CONSTRUCTOR

=over 4

=item new('path/to/06perms.txt.gz')

=item new(parmsfile => 'path/to/06perms.txt.gz')

Constructs a new instance of Parse::CPAN::Perms from the specified perms file.
The file must exist and must be readable.

=back

=head2 METHODS

=over 4

=item perms()

Returns all the permission data as a hash reference

=item is_authorized(AUTHOR => 'Package::Name')

Returns true if the author has permission for the package

=back

=head1 SEE ALSO

L<CPAN::Repository::Perms> serves a similar purpose, but is a much more robust 
module.  However, it is bundled with several other CPAN-related modules which 
may or may not fit your needs and desires.
