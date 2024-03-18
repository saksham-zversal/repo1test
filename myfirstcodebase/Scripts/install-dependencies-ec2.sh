#!/bin/bash

sudo yum update -y
sudo yum install docker unzip cronie dos2unix -y
sudo systemctl start docker.service
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
sudo systemctl start crond
sudo systemctl enable crond

# Clean up
rm -f awscliv2.zip
yum remove unzip -y
echo "Script execution completed successfully."