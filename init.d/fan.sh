#!/bin/sh
# Start/stop the fan daemon.
#
### BEGIN INIT INFO
# Provides:          fan
# Required-Start:    $remote_fs $syslog $time
# Required-Stop:     $remote_fs $syslog $time
# Should-Start:      $network $named slapd autofs ypbind nscd nslcd winbind
# Should-Stop:       $network $named slapd autofs ypbind nscd nslcd winbind
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: Run fan adjusted by temp
# Description:       Run fan adjusted by temp
### END INIT INFO

/home/pi/rpi-fan/fan.py &
