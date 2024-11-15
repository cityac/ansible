#!/usr/bin/bash

sudo apt update
sudo apt-get update
sudo apt-get install ansible
sudo apt install ubuntu-desktop xrdp

sudo usermod -aG sudo $LOGNAME
echo "$LOGNAME ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
