#! /bin/bash
sudo mount -o remount,rw / ; sudo mount -o remount,rw /boot
sudo apt update
sudo apt upgrade
sudo apt install git

sudo pip3 install dmr_utils3
git clone https://github.com/HBLink-org/hblink3.git
git clone https://github.com/sp2ong/HBmonitor.git

sudo sh ./dmr_utils3/install.sh
sudo sh ./hblink3/install.sh
sudo pip3 install -r ./HBmonitor/requirements.txt

sudo cp ipv4.fw /root/ipv4.fw
sudo pistar-firewall

sudo cp hblink3_bridge.service /etc/systemd/system/hblink3_bridge.service
sudo systemctl enable hblink3_bridge.service
sudo systemctl start hblink3_bridge.service

sudo cp hblink3_playback.service /etc/systemd/system/hblink3_playback.service
sudo systemctl enable hblink3_playback.service
sudo systemctl start hblink3_playback.service

sudo cp hbmonitor3.service /etc/systemd/system/hbmon.service
sudo systemctl enable hbmon.service
sudo systemctl start hbmon.service

cd HBmonitor
cp config_SAMPLE.py config.py