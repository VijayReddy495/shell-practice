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
Script_Name=$(echo $0 | cut -d "." -f1) 
Log_File="$Log_Folder/$Script_Name.log"

mkdir -p Log_Folder

validate(){
   if [ $1 -eq 0 ]; then 
    echo -e "$2 has been ...$G successfully $N installed" | tee -a Log_File
   else
    echo -e "there is...$R error $N installing $2 package" | tee -a Log_File
    exit 1
   fi
}

dnf list installed mysql >> Log_File
if [ $? -ne 0 ]; then 
    dnf install mysql -y
    validate $? "mysql"
else    
    echo -e "mysql is already installed, So ...$Y Skipping $N" | tee -a Log_File 
fi     

dnf list installed nginx >> Log_File
if [ $? -ne 0 ]; then 
    dnf install nginx -y
    validate $? "nginx"
else 
    echo -e "nginx is already installed, So ...$Y Skipping $N" | tee -a Log_File
fi    

dnf list installed python3 >> Log_File
if [ $? -ne 0 ]; then 
    dnf install python3 -y
    validate $? "python3"
else 
    echo -e "python3 is already installed, So ...$Y Skipping $N" | tee -a Log_File
fi        


