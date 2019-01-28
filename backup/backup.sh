#!/usr/bin/env bash

set -e

# source folder which will be backup
folders=()
# database name which will be backup
mysql_db_names=()
# mysql extra-file which contain mysql-connection information.
mysql_extra_file=
# the name of sql exported file.
mysql_export_file=
# the folder to save the backup data.
export_folder=/tmp/databackup
# the name of export package.
export_name=name$(date "+%Y-%m-%d-%H-%M-%S")
# if 1, backup the file.
export_file=1
# if 1, backup the mysql.
export_mysql=1

source first.sh

final_folder=$export_folder/$export_name

if [ $export_file == "1" ]; then
    file
fi

if [ $export_mysql == "1" ]; then
    mysql
fi

# package
zip -r $final_folder.zip $final_folder

source last.sh

file () {
    echo "Start backup the file"
    if [ ! -d "$export_folder" ];then
        mkdir $final_folder
    fi

    for folder in ${folders[@]}; do
        cp -rf $folder $export_folder
    done
    echo "Backup the file have finished"
}

mysql () {
    echo "Start backup the mysql"
    if [ ! -d "$export_folder" ]; then
        mkdir $export_folder
    fi

    for name in ${mysql_db_names[@]}; do
        mysqldump --default-extra-file=$mysql_extra_file $name > $mysql_export_file
    done
    echo "Backup the mysql have finished"
}
