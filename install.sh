#! /bin/bash
rpi-rw
sudo apt update
sudo apt upgrade
sudo apt install git
git clone https://github.com/n0mjs710/dmr_utils
git clone https://github.com/n0mjs710/HBLink
cd dmr_utils
sudo ./install.sh
cd ..
cp hblink_bridgeall.cfg ./hblink_bridgeall.cfg
cd HBLink/
sh ./install.sh
cd ..
sudo cp ipv4.fw /root/ipv4.fw
sudo pistar-firewall
sudo cp hblink_bridgeall.service /etc/systemd/system/hblink_bridgeall.service
sudo systemctl enable hblink_bridgeall.service
sudo systemctl start hblink_bridgeall.service
