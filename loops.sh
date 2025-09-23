#!/bin/bash

userid=$(id -u)


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $userid -ne 0 ]; then
    echo "user don't have previliage access to install "
    exit 1
fi 

Log_Folder="/var/log/shell-script"
Script_Name=$( echo $0 | cut -d "." -f1 ) 
Log_File="$Log_Folder/$Script_Name.log"
echo "script started executing at : $(date)" | tee -a Log_File

mkdir -p $Log_Folder

validate(){
   if [ $1 -eq 0 ]; then 
    echo -e "$2 has been ...$G successfully $N installed" | tee -a Log_File
   else
    echo -e "there is...$R error $N installing $2 package" | tee -a Log_File
    exit 1
   fi
}

for package in $@ 
do
   dnf list installed $package &>>$Log_File
   if [ $? -ne 0 ]; then 
        dnf install $package -y &>>$Log_File
        validate $? "$package"
   else
        echo -e "$package is already installed so ,... $Y skipping $N "
    fi
done 
