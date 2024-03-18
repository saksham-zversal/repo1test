#!/bin/bash
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/base.env" set
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/$ENVIRONMENT.env" set

aws iam create-instance-profile  --instance-profile-name $IAM_PROFILE_NAME
aws iam add-role-to-instance-profile --role-name $IAM_ROLE_NAME --instance-profile-name $IAM_PROFILE_NAME
aws ec2 associate-iam-instance-profile --instance-id $EC2_INSTANCE_ID --iam-instance-profile Name=$IAM_PROFILE_NAME

if [ $? -eq 0 ]; then
    echo "Instance profile is attached to the ec2 instance successfully"   
else
    echo "Unable to attach Instance profile to the ec2 instance"
fi