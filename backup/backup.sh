#!/usr/bin/env bash

set -e

folders=
mysql_extra_file=
target_folder=

source first.sh

source last.sh

file () {
    echo "Start backup the file"
    echo "Backup the file have finished"
}

mysql () {
    echo "Start backup the mysql"
    echo "Backup the mysql have finished"
}
