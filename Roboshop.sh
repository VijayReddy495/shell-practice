#!/bin/bash

AMI_ID="ami-09c813fb71547fc4f"
SG_ID="sg-0411021f836b1fbcc"

for $instance in $@
do
    INSTANCE_ID=$(aws ec2 run-instances --image-id $AMI_ID --instance-type t3.micro 
    --security-group-ids $SG_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,
    Value=$instance}]" --query 'Instances[0].InstanceId' --output text)
    

done