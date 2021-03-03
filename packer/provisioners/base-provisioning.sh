#!/bin/bash

application_file_path="/vagrant/installed-application.md"

# install docker
lock_filename="/var/lib/dpkg/lock-frontend"
if [ -f "$lock_filename" ]; then
  sudo rm -f $lock_filename
fi
sudo apt update
if [ -f "$lock_filename" ]; then
  sudo rm -f $lock_filename
fi
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add docker repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# install docker
if [ -f "$lock_filename" ]; then
  sudo rm -f $lock_filename
fi
sudo apt-get update
if [ -f "$lock_filename" ]; then
  sudo rm -f $lock_filename
fi
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

# install docker service
# sudo systemctl start docker
# sudo systemctl enable docker

# add vagrant user to docker group
sudo groupadd docker
sudo gpasswd -a vagrant docker

# get docker version
DOCKER_VERSION=$(sudo docker version --format '{{.Server.Version}}')
echo "# Installed application "  > $application_file_path
echo "***                     " >> $application_file_path
echo "> docker $DOCKER_VERSION" >> $application_file_path
