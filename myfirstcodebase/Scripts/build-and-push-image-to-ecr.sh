#!/usr/bin/env sh

docker build -t $imagename .
docker tag $imagename:$IMAGE_TAG $Aws_account_id.dkr.ecr.$Region.amazonaws.com/$ECR_REPOSITORY:$IMAGE_TAG

docker push $Aws_account_id.dkr.ecr.region.amazonaws.com/$ECR_REPOSITORY

# To push an image to the Amazon ECR repository, we need to authenticate the Docker client to the registry. 
# Each registry requires its own authentication token. To proceed with the authentication, we would run a get-login-password command in 
# the CLI to retrieve the token and then pass it to the docker login command.