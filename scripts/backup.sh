#!/bin/bash
####### variables ##########
BACKUPDIR="/mnt/backups";
DATE=`date +%F`;
TO_BACKUP="/etc /home /mnt/scripts";
#OMIT="admin|backups|script"

###### backup files #######
DIRECTORY+=(`ls -d $TO_BACKUP/*/ | cut -d "/" -f 3 | grep -Ev "$OMIT"`)

# do the backups
for (( i=0; i<${#DIRECTORY[*]} ; i++ ))
do
        tar czf $BACKUPDIR/files-${DIRECTORY[i]}-$DATE.tar.gz $TO_BACKUP/${DIRECTORY[i]}/public_html/ &> /dev/null
done

###### delete files older than 3 days ######
#find $BACKUPDIR -type f -mtime +3 -exec rm {} \;
#!/bin/bash
####mysql variables######
MYSQLUSERNAME=""
MYSQLPASS=""
MYSQLHOST="localhost"
BACKUPDIR="."
DATE=`date +%F`

# return databases
DATABASES+=(`mysql -s -e 'SHOW DATABASES;' |grep -v "information_schema"|grep -v "mysql" |tr '\n' ' '`)

# do the backups
for (( i=0; i<${#DATABASES[*]} ; i++ ))
do
	mysqldump --dump-date ${DATABASES[i]} | gzip -f > ./mysql-${DATABASES[i]}-$DATE.gz
done
