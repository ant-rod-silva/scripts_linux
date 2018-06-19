#!/bin/zsh
COR=`tput setaf 3`
NC=`tput sgr0` # No Color
sh -c "clear"

# Drop public schema
echo "${COR}Drop public schema ${NC}"
/usr/bin/psql --dbname=db_name --host=host_name --username=user_name -c "DROP SCHEMA IF EXISTS public CASCADE"

# Create a public schema
echo "${COR}Create a public schema ${NC}"
/usr/bin/psql --dbname=db_name --host=host_name --username=user_name -c "CREATE SCHEMA public"

# Restore DB
echo "${COR}Restore DB ${NC}"
/usr/bin/psql --dbname=db_name --host=host_name --username=user_name -W < backup_file_name.sql

echo "Finished."
sleep 2

