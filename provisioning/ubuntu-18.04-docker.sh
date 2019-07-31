#!/bin/bash

# Ubuntu provisioning file

# install docker
sudo apt update
sudo apt install -y docker.io

# install docker service
sudo systemctl start docker
sudo systemctl enable docker

# add vagrant user to docker group
sudo groupadd docker
sudo gpasswd -a vagrant docker

# create date string
DATE=`date +%Y%m%d%H%M`

# get docker version
DOCKER_VERSION=$(docker version --format '{{.Server.Version}}')
echo "$DOCKER_VERSION.$DATE" > /vagrant/version
