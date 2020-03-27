#! /bin/bash
rpi-rw
sudo apt update
sudo apt upgrade
sudo apt install git
git clone https://github.com/n0mjs710/dmr_utils3.git
git clone https://github.com/n0mjs710/hblink3.git
sudo sh ./dmr_utils3/install.sh
sudo sh ./hblink3/install.sh
cp rules.py ./hblink3/rules.py
sudo cp ipv4.fw /root/ipv4.fw
sudo pistar-firewall
sudo cp hblink3_bridgeall.service /etc/systemd/system/hblink3_bridge.service
sudo systemctl enable hblink3_bridge.service
sudo systemctl start hblink3_bridge.service
