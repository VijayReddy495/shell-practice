#!/bin/bash

userid=$(id -u)

if [ userid -ne 0 ]; then
    echo "user don't have previliage access to install "
fi  

validate(){
   if [ $1 -eq 0 ]; then 
    echo "$2 has been successfully installed"
   else
    echo "there is error installing $2 package"
 
}

dnf install mysql -y
validate $? "mysql"

dnf install nginx -y
validate $? "nginx"

dnf install python3 -y
validate $? "python3"

