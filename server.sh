#!/bin/bash
#
# Description: server
#
# Source function library

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
NAME=SERVER_NAME
USER=SERVER_USER
DAEMON=SERVER_DAEMON
PROCESS=/var/run/$NAME.pid

if [ ! -f "$DAEMON" ]; then
	echo "$DAEMON not found"
	exit
fi

# Start the server
start (){
	# Check serve's status
	start-stop-daemon --status --pidfile=$PROCESS
	code=$?
	if [ code == 0 ]; then
		echo "$NAME is already running"
		exit 0
	fi

	start-stop-daemon --start --make-pidfile --background --pidfile=$PROCESS --user=$USER --exec=$DAEMON
	res = $?
	echo "$NAME start successful, pid(`cat $PROCESS`)"
}

# Stop the server
stop (){
	# Check serve's status
	start-stop-daemon --status --pidfile=$PROCESS
	code=$?
	if [ code != 0 ]; then
		echo "$NAME is not running"
		exit 0
	fi

	start-stop-daemon --stop --pidfile=$PROCESS
	echo "$NAME stop successful"
}

# Return the status of the server
status (){
	start-stop-daemon --status --pidfile=$PROCESS
	code=$?
	if [ code == 0 ]; then
		echo "$NAME is running, pid(`cat $PROCESS`)"
	else
		echo "$NAME is not running"
	fi
}

# Restart the server
restart (){
	stop
	start
}

usage (){
	echo "Usage: start|stop|restart|status"
}


case $1 in
start)
	start
	;;

stop)
	stop
	;;

restart)
	restart
	;;

status)
	status
	;;
*)
	usage
	exit 1
	;;
esac