#!/usr/bin/env bash
ENVIRONMENT=$1
if [[ "$ENVIRONMENT" != "prod" && "$ENVIRONMENT" != "dev" ]]; then
    ENVIRONMENT="dev"
fi

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/base.env" set
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/$ENVIRONMENT.env" set

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S") 

# Check if docker container with the same name exists, stop it
if  sudo docker ps -a --format '{{.Names}}' | grep -q "$CONTAINER_NAME"; then
    sudo docker stop "$CONTAINER_NAME"
fi

 # Check if latest image with name $REPO_NAME exists, then remove it
if  sudo docker images --format '{{.Repository}}:{{.Tag}}' | grep -q "$REPO_NAME:latest"; then
    sudo docker rmi $ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest
fi

# Remove old log files
find $LOG_DIR/newsSearchCriteria*.log -mtime +7 -exec rm -f {} \;

aws ecr get-login-password --region $REGION --output text | sudo docker login --username AWS --password-stdin $ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com

# Start docker
sudo service docker start

sudo docker pull $ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest

sudo docker run --name "$CONTAINER_NAME" -p 8596:8596 -d  --rm "$ACCOUNT_NUMBER.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest"

#new add
sudo docker logs --follow $CONTAINER_NAME >> $LOG_DIR/newsSearchCriteria_$TIMESTAMP.log 2>&1 &