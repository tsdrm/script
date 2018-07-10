#!/bin/bash
#
# Description: server
#
# Source function library
. /etc/init.d/functions

NAME=SERVER_NAME
USER=SERVER_USER

# Start the server
start (){

}

# Stop the server
stop (){

}

# Return the status of the server
status (){

}

# Restart the server
restart (){

}

usage (){

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