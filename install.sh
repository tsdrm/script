#!/bin/bash
set -e

show_usage="./install.sh -u(--user) user -n(--name) name -e(--exec) exec" 

server_name=""
server_user=""
server_exec=""

while [ -n "$1" ]; do
	case "$1" in
		-n|--name ) server_name=$2 ; shift 2;;
		-u|--user ) server_user=$2 ; shift 2;;
		-e|--exec ) server_exec=$2 ; shift 2;;
		* ) echo $show_usage; exit 1 ;;
	esac
done

echo "Received: server_name: $server_name, server_user: $server_user, server_exec: $server_exec"

if [[ "" == $server_name ]]; then
	echo "Invalid name"
elif [[ "" == $server_exec ]]; then
	echo "Invalid exec"
elif [[ "" == $server_user ]]; then
	echo "Invalid user"
fi

serverd=/etc/init.d/${server_name}d
cp server.sh serverd

sed 's/SERVER_NAME/server_name/' serverd
sed 's/SERVER_USER/server_user/' serverd
sed 's/SERVER_DAEMON/server_exec/' serverd

echo "Install success!!!"