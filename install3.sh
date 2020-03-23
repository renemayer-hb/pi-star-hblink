#! /bin/bash
rpi-rw
sudo apt update
sudo apt upgrade
sudo apt install git
git clone https://github.com/n0mjs710/dmr_utils3.git
git clone https://github.com/n0mjs710/hblink3.git
cd dmr_utils3
sudo sh ./install.sh
cd ..
cp hblink3_bridgeall.cfg ./hblink3/hblink3_bridgeall.cfg
cd hblink3
sudo sh ./install.sh
cd ..
sudo cp ipv4-server.fw /root/ipv4.fw
sudo pistar-firewall
sudo cp hblink3_bridgeall.service /etc/systemd/system/hblink3_bridgeall.service
sudo systemctl enable hblink3_bridgeall.service
sudo systemctl start hblink3_bridgeall.service
