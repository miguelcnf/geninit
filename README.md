geninit
=======

Quickly generate init scripts for custom daemons.

USAGE
=====

Run the command:

  `./geninit name_of_the_daemon_process start_action [stop_action]`

Example 1 - with stop action:

  `./geninit "bazinga" "/usr/local/sbin/bazinga --action start" "/usr/local/sbin/bazinga --action stop"`

Example 2 - without stop action (using "killproc name_of_the_daemon_process" to stop):

  `./geninit "bazinga" "/usr/local/sbin/bazinga --action start"`

DOCUMENTATION
=============

Documentation for the GenInit module available with the perldoc command.

  `perldoc lib/GenInit.pm`

LICENSE AND COPYRIGHT
=====================

Copyright (C) 2012 Miguel Fonseca

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.
