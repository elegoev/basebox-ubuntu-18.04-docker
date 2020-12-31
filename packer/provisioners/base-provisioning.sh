#!/bin/bash

application_file_path="/vagrant/installed-application.md"

# install docker
sudo apt update
sudo apt install -y docker.io

# install docker service
sudo systemctl start docker
sudo systemctl enable docker

# add vagrant user to docker group
sudo groupadd docker
sudo gpasswd -a vagrant docker

# get docker version
DOCKER_VERSION=$(docker version --format '{{.Server.Version}}')
echo "# Installed application "  > $application_file_path
echo "***                     " >> $application_file_path
echo "> docker $DOCKER_VERSION" >> $application_file_path
