#!/bin/bash

echo "printing all the variaables : $@"
echo "current running script : $0"
echo "PID number of the current script :$$"
sleep 25 &
echo "PID of the last command in sleep :$!"

number1=110
number2=220
string1=devops

addition_result = $sum(($number1+$number2+$string1))

echo "sum of the numbers is :$addition_result"