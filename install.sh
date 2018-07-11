#!/bin/bash
set -e

show_usage="./install.sh -u(--user) user -n(--name) name -e(--exec) exec" 

server_name=""
server_user=""
server_exec=""
server_path=""

while [ -n "$1" ]; do
	case "$1" in
		-n|--name ) server_name=$2 ; shift 2;;
		-u|--user ) server_user=$2 ; shift 2;;
		-e|--exec ) server_exec=$2 ; shift 2;;
		-d|--chdir ) server_path=$2 ; shift 2;;
		* ) echo $show_usage; exit 1 ;;
	esac
done

echo "Received: server_name: $server_name, server_user: $server_user, server_exec: $server_exec"

if [[ "" == $server_name ]]; then
	echo "Invalid name"
	exit 1
elif [[ "" == $server_exec ]]; then
	echo "Invalid exec"
	exit 1
elif [[ "" == $server_user ]]; then
	echo "Invalid user"
	exit 1
fi

if [ "" == $server_path ]; then
	server_path=`pwd`
fi


serverd=/etc/init.d/${server_name}d
cp -f server.sh $serverd

sed -i "s!SERVER_NAME!$server_name!" $serverd
sed -i "s!SERVER_USER!$server_user!" $serverd
sed -i "s!SERVER_DAEMON!$server_exec!" $serverd
sed -i "s!SERVER_PATH!$server_path!" $serverd

echo "Install success!!!"