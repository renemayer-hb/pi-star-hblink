#! /bin/bash
sudo mount -o remount,rw / ; sudo mount -o remount,rw /boot
sudo apt update
sudo apt upgrade
sudo apt install git

git clone https://github.com/n0mjs710/dmr_utils3.git
git clone https://github.com/HBLink-org/hblink3.git
git clone https://github.com/kc1awv/hbmonitor3.git

sudo sh ./dmr_utils3/install.sh
sudo sh ./hblink3/install.sh
sudo pip3 install -r ./hbmonitor3/requirements.txt

sudo cp ipv4.fw /root/ipv4.fw
sudo pistar-firewall

sudo cp hblink3_bridge.service /etc/systemd/system/hblink3_bridge.service
sudo systemctl enable hblink3_bridge.service
sudo systemctl start hblink3_bridge.service

sudo cp hblink3_playback.service /etc/systemd/system/hblink3_playback.service
sudo systemctl enable hblink3_playback.service
sudo systemctl start hblink3_playback.service

sudo cp hbmonitor3.service /etc/systemd/system/hbmonitor3.service
sudo systemctl enable hbmonitor3.service
sudo systemctl start hbmonitor3.service

cp config.py ./hbmonitor3/config.py