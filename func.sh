#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"


if [ $userid -ne 0 ]; then
    echo "user don't have previliage access to install "
    exit 1
fi  

validate(){
   if [ $1 -eq 0 ]; then 
    echo -e "$2 has been ...$G successfully $N installed"
   else
    echo -e "there is...$R error $N installing $2 package"
    exit 1
   fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then 
    dnf install mysql -y
    validate $? "mysql"
else    
    echo -e "mysql is already ...$G installed $N"
fi     

dnf list installed nginx 
if [ $? -ne 0 ]; then 
    dnf install nginx -y
    validate $? "nginx"
else 
    echo -e "nginx is already ...$G installed $N"
fi    

dnf list installed python3
if [ $? -ne 0 ]; then 
    dnf install python3 -y
    validate $? "python3"
else 
    echo -e "python3 is already ...$G installed $N"
fi        


