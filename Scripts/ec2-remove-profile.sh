#!/bin/bash
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/base.env" set
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/$ENVIRONMENT.env" set

aws ec2 disassociate-iam-instance-profile --association-id $IAM_PROFILE_ASSOCIATION_ID

aws iam remove-role-from-instance-profile --instance-profile-name $IAM_PROFILE_NAME --role-name $IAM_ROLE_NAME

aws iam delete-instance-profile --instance-profile-name $IAM_PROFILE_NAME

if [ $? -eq 0 ]; then
    echo "Instance profile is removed successfully"
else
    echo "Unable to removed Instance profile to the ec2 instance"
fi
