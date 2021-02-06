#!/bin/bash

curl https://download.argon40.com/argonfanhat.sh > /tmp/argonfanhat.sh
source /tmp/argonfanhat.sh

cat >> /boot/firmware/config.txt <<EOL
over_votage=6
arm_freq=2100
gpu_freq=600
EOL

sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common 

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose

