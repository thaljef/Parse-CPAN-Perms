# NAME

Parse::CPAN::Perms - Parse 06perms.txt.gz

# VERSION

version 0.001

# SYNOPSIS

    # Construction
    my $perms = Parse::CPAN::Perms->new('path/to/06perms.txt.gz');

    # Get all perms data as hash ref
    my $perms_data = $perms->perms;

    # Boolean convenience method
    $perms->is_authorized(AUTHOR => 'Package::Name');

# DESCRIPTION

!! THIS MODULE IS EXPERIMENTAL.  INTERFACE IS SUBJECT TO CHANGE !!

This module parses the `06perms.txt.gz` file from a CPAN-like repository.
At this time, it only parses the compressed form and it provides no mechanism
for adding new permissions or writing the data back out to a file.  If you
desire those features, please contact the author.

# CONSTRUCTOR

- new('path/to/06perms.txt.gz')
- new(parmsfile => 'path/to/06perms.txt.gz')

    Constructs a new instance of Parse::CPAN::Perms from the specified perms file.
    The file must exist and must be readable.

## METHODS

- perms()

    Returns all the permission data as a hash reference

- is\_authorized(AUTHOR => 'Package::Name')

    Returns true if the author has permission for the package

# SUPPORT

## Perldoc

You can find documentation for this module with the perldoc command.

    perldoc Parse::CPAN::Perms

## Websites

The following websites have more information about this module, and may be of help to you. As always,
in addition to those websites please use your favorite search engine to discover more resources.

- MetaCPAN

    A modern, open-source CPAN search engine, useful to view POD in HTML format.

    [http://metacpan.org/release/Parse-CPAN-Perms](http://metacpan.org/release/Parse-CPAN-Perms)

- CPAN Ratings

    The CPAN Ratings is a website that allows community ratings and reviews of Perl modules.

    [http://cpanratings.perl.org/d/Parse-CPAN-Perms](http://cpanratings.perl.org/d/Parse-CPAN-Perms)

- CPANTS

    The CPANTS is a website that analyzes the Kwalitee ( code metrics ) of a distribution.

    [http://cpants.perl.org/dist/overview/Parse-CPAN-Perms](http://cpants.perl.org/dist/overview/Parse-CPAN-Perms)

- CPAN Testers

    The CPAN Testers is a network of smokers who run automated tests on uploaded CPAN distributions.

    [http://www.cpantesters.org/distro/P/Parse-CPAN-Perms](http://www.cpantesters.org/distro/P/Parse-CPAN-Perms)

- CPAN Testers Matrix

    The CPAN Testers Matrix is a website that provides a visual overview of the test results for a distribution on various Perls/platforms.

    [http://matrix.cpantesters.org/?dist=Parse-CPAN-Perms](http://matrix.cpantesters.org/?dist=Parse-CPAN-Perms)

- CPAN Testers Dependencies

    The CPAN Testers Dependencies is a website that shows a chart of the test results of all dependencies for a distribution.

    [http://deps.cpantesters.org/?module=Parse::CPAN::Perms](http://deps.cpantesters.org/?module=Parse::CPAN::Perms)

## Internet Relay Chat

You can get live help by using IRC ( Internet Relay Chat ). If you don't know what IRC is,
please read this excellent guide: [http://en.wikipedia.org/wiki/Internet\_Relay\_Chat](http://en.wikipedia.org/wiki/Internet\_Relay\_Chat). Please
be courteous and patient when talking to us, as we might be busy or sleeping! You can join
those networks/channels and get help:

- irc.perl.org

    You can connect to the server at 'irc.perl.org' and join this channel: \#pinto then talk to this person for help: thaljef.

## Bugs / Feature Requests

[https://github.com/thaljef/Parse-CPAN-Perms/issues](https://github.com/thaljef/Parse-CPAN-Perms/issues)

## Source Code

The code is open to the world, and available for you to hack on. Please feel free to browse it and play
with it, or whatever. If you want to contribute patches, please send me a diff or prod me to pull
from your repository :)

[https://github.com/thaljef/Parse-CPAN-Perms](https://github.com/thaljef/Parse-CPAN-Perms)

    git clone git://github.com/thaljef/Parse-CPAN-Perms.git

# AUTHOR

Jeffrey Ryan Thalhammer <jeff@stratopan.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jeffrey Ryan Thalhammer.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
