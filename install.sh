#!/bin/bash

#THIS IS FOR UBUNTU 20.10 ARM64 EDITION

# Install the script for the argon fan hat.
# Change or comment this out this if you have a different/no fan hat.
curl https://download.argon40.com/argonfanhat.sh > /tmp/argonfanhat.sh
source /tmp/argonfanhat.sh

# Add the lines required to overclock the pi 4.
# Note: Only do this if you have a decent active cooling setup
# IE: argon one & fan, argon neo & fan hat, or a comparable setup 
# Maximum values are:
# 2147 for the SoC
# 750 for the GPU
cat >> /boot/firmware/config.txt <<EOL
over_votage=6
arm_freq=2100
gpu_freq=600
EOL

# update apt and install prereqs
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common 
sudo apt-get dist-upgrade -7

# add apt repos for docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# update apt and install docker-ce + docker compose
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose

