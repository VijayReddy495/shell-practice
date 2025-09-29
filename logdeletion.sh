#!/bin/bash

Log_Dir="/var/log/shell-practice"
Log_FileName=$( echo $0 | cut -d "." -f1)
Log_Path="$Log_Dir/$Log_FileName.log"

mkdir -p $Log_Path
echo "script started executing at :$(date)" | tee -a $Log_Path

Source_Dir=/home/ec2-user/app-logs

if[ ! -d $Source_Dir ]; then 
    echo "Source Directory doesn't exists"
    exit 1
fi

Files_To_Delete=$(find $Source_Dir -name "*.log" -type f -mtime +14)

while IFS=read -r filepath
    do
    echo "Deleting the files: $filepath"
    remove -rf $filepath
    echo "Deleted the files: $filepath"
done <<< $Files_To_Delete



