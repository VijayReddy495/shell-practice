#!/bin/bash

number=$1

if [ $number -lt 20 ]; then 
    echo "number is less than 20"
elif [ $number -eq 20 ]; then 
    echo "number is equal to 20"
else 
    echo "number is greater than 20"
fi 