#!/usr/bin/bash

sudo apt update
sudo apt-get update

sudo apt-add-repository -y ppa:ansible/ansible

sudo apt-get install ansible
# sudo apt install ubuntu-desktop xrdp
sudo apt-get install -y liblua5.1-dev liblua5.3-dev libluajit-5.1-dev

sudo usermod -aG sudo $LOGNAME
echo "$LOGNAME ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# sh ansible.sh

# sudo passwd ubuntu