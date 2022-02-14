#!/bin/bash

sudo -i

apt update -y && sudo apt dist-upgrade -y && sudo apt autoremove -y 

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

bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered) -y

systemctl enable nodered.service

systemctl enable firewalld

systemctl start firewalld 

firewall-cmd --state

firewall-cmd --permanent --add-port=1-9999/tcp -y

firewall-cmd --reload
