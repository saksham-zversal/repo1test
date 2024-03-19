#!/usr/bin/env bash
IMAGE_TAG=test
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/base.env" set

aws ecr get-login-password --region $Region | docker login --username AWS --password-stdin $Aws_account_id.dkr.ecr.$Region.amazonaws.com

aws ecr create-repository \
    --repository-name $Repo_name_for_ecr \
    --region $Region

docker build -t $imagename .
docker tag $imagename:$IMAGE_TAG $Aws_account_id.dkr.ecr.$Region.amazonaws.com/$Repo_name_for_ecr:$IMAGE_TAG

docker push $Aws_account_id.dkr.ecr.region.amazonaws.com/$Repo_name_for_ecr

# To push an image to the Amazon ECR repository, we need to authenticate the Docker client to the registry. 
# Each registry requires its own authentication token. To proceed with the authentication, we would run a get-login-password command in 
# the CLI to retrieve the token and then pass it to the docker login command.