#!/usr/bin/env bash

set -e

# the name of export package.
export_name=name$(date "+%Y-%m-%d-%H-%M-%S")
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
# if 1, backup the file.
export_file=1
# if 1, backup the mysql.
export_mysql=1
final_folder=$export_folder/$export_name


# Start exec the backup script.
echo "backup script start"
source first.sh

backup_file () {
    echo "Start backup the file"
    if [ ! -d "$final_folder" ];then
        mkdir $final_folder
    fi

    for folder in ${folders[@]}; do
        echo "cp -rf $folder $final_folder"
        cp -rf $folder $final_folder
    done
    echo "Backup the file have finished"
}

backup_mysql () {
    echo "Start backup the mysql"
    if [ ! -d "$final_folder" ]; then
        mkdir $final_folder
    fi

    for name in ${mysql_db_names[@]}; do
        echo "mysqldump --defaults-extra-file=$mysql_extra_file $name > $final_folder/$name.sql"
        mysqldump --defaults-extra-file=$mysql_extra_file $name > $final_folder/$name.sql
    done
    echo "Backup the mysql have finished"
}



if [ "$export_file" == "1" ]; then
    backup_file
fi

if [ "$export_mysql" == "1" ]; then
    backup_mysql
fi

# package
cd $export_folder
zip -r $final_folder.zip $export_name

cd -
source last.sh

echo "backup script finished"
