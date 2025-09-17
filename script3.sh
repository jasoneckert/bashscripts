#!/bin/bash
#This script removes old OracleDB backups and then backs up OracleDB
#If a backup is successful, it is logged to /var/log/oraclebackuplog
#If a backup fails, it is logged and the log is emailed to Jason Eckert

rm -f /remoteserver/backup-oracle*

if tar -zcvf /remoteserver/backup-oracle-$(date +%F).tar.gz /oracledb/*
  then
  echo "Oracle backup completed on $(date)" >>/var/log/oraclebackuplog 

  else
  echo "Oracle backup failed on $(date)" >>/var/log/oraclebackuplog
  mail -s "BACKUP FAILED" jason.eckert@trios.com </var/log/oraclebackuplog
fi
