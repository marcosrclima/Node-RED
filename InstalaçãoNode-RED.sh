#!/bin/bash

sudo -i

timedatectl set-timezone America/Sao_Paulo

apt update -y && apt upgrade -y && apt autoremove -y 

fallocate -l 3G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon --show
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

apt-get install \
jq \
wget \
curl \
udisks2 \
libglib2.0-bin \
network-manager \
iputils-ping \
firewalld \
vim \
openssh-server \
dbus -y

systemctl enable firewalld

systemctl start firewalld 

firewall-cmd --state

firewall-cmd --permanent --add-port=1-9999/tcp

firewall-cmd --reload

bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered) 

systemctl enable nodered.service
