#!/bin/bash

# bash script to generate a postgresql database backup using cron and remove old files
#
# crontab -e:
#
# At 09:05
# 0 9 * * * echo 'sh /home/<user>/<script_location_dir>/backup_db_cron.sh' | /bin/bash

COR=`tput setaf 3`
NC=`tput sgr0` # No Color
sh -c "clear"

# Location to place backups.
backup_dir="/home/<user>/<target_dir>"

#Numbers of days you want to keep a copy of your database
number_of_days=30

echo "${COR}DB Backup${NC}"
/usr/bin/pg_dump --host=000.000.111.111 --username=user --schema=public -O -v > $backup_dir/backup_file_name_$(date +%d_%m_%Y_%H_%M).sql

echo "${COR}Removing old files (> 30 days)${NC}"
find $backup_dir -type f -prune -mtime +$number_of_days | xargs rm -rf
