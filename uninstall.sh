#!/bin/bash
set -e

show_usage() {
     printf "./uninstall.sh -n process\n\
 -n|--name%-8sprocess name\n\
 -h|--help%-8sfor help\n"
}


server_name=""
while [ -n "$1" ]; do
	case "$1" in
		-n|--name ) server_name=$2 ; shift 2;;
		-h|--help ) echo show_usage ; exit 0;;
		* ) show_usage; exit 1 ;;
	esac
done

if [[ "" == $server_name ]];then
    echo "Uninstall server: Invalid server"
    exit 1
fi

echo "Uninstalling server $server_name"

update-rc.d -f $server_name remove
rm -f /etc/init.d/$server_name
echo "Uninstall server $server_name successfully!!!"
