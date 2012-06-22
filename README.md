geninit
=======

Perl module to quickly generate init scripts for custom daemons.

USAGE
=====

Run the command:

	./geninit name_of_the_daemon_process path_to_the_daemon [start_options]

Example:

	./geninit "zabbix_agentd" "/usr/local/sbin/zabbix_agentd" "-c /etc/zabbix/zabbix_agentd.conf"

DOCUMENTATION
=============

Documentation for this module available with the perldoc command.

	perldoc lib/GenInit.pm

LICENSE AND COPYRIGHT
=====================

Copyright (C) 2012 Miguel Fonseca

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.
