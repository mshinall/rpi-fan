#!/bin/sh -e
# Start/stop the fan daemon.
#
### BEGIN INIT INFO
# Provides:          rpi-fan
# Required-Start:    $remote_fs $syslog $time
# Required-Stop:     $remote_fs $syslog $time
# Should-Start:      $network $named slapd autofs ypbind nscd nslcd winbind
# Should-Stop:       $network $named slapd autofs ypbind nscd nslcd winbind
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: Run fan adjusted by temp
# Description:       Run fan adjusted by temp
### END INIT INFO

. /lib/lsb/init-functions

RETVAL=0
name=rpi-fan
daemon=/usr/bin/$name
pidfile=/var/run/$name.pid



start() {
	if [ -f $pidfile ]; then
		log_daemon_msg "$name is already started"
		return
	else
		log_daemon_msg echo "Starting $name..."
		start-stop-daemon --start --background --pidfile $pidfile --exec $daemon
	fi
	log_end_msg $?
}

stop() {
	log_daemon_msg "Stopping $name..."
	start-stop-daemon --stop --pidfile $pidfile
	log_end_msg $?
	rm -f $pidfile
}

status() {
	status_of_proc -p $pidfile $daemon $name && exit 0 || exit $?
}

case "$1" in
	start)
		start
	;;
	stop)
		stop
	;;
	restart)
		stop
		start
	;;
	status)
		status
	;;
	*)
		echo "Usage: /etc/init.d/$name [stop|start|restart|status]"
	;;
esac



