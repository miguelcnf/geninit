package GenInit;

use 5.008008;
use strict;
use warnings;

require Exporter;
use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration   use GenInit ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw() ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw();

our $VERSION = '1.0.0';


# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__

=head1 NAME

GenInit - Perl Meta Module.

=head1 SYNOPSIS

use GenInit;

=head1 ABSTRACT

Perl module to quickly generate init scripts for custom daemons.

=head1 DESCRIPTION

GenInit is a perl module that tries to simplify the proccess of creating init scripts for custom daemons.

=head2 EXPORT

None by default.

=head1 SEE ALSO

https://github.com/miguelcnf

=head1 AUTHOR

Created by: Miguel Fonseca;

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by Miguel Fonseca.

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=cut
