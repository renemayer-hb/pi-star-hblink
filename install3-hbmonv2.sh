#! /bin/bash
sudo mount -o remount,rw / ; sudo mount -o remount,rw /boot
sudo apt update
sudo apt upgrade
sudo apt install git

sudo pip3 install dmr_utils3
git clone https://github.com/HBLink-org/hblink3.git
git clone https://github.com/sp2ong/HBMonv2.git

sudo sh ./dmr_utils3/install.sh
sudo sh ./hblink3/install.sh


sudo cp ipv4.fw /root/ipv4.fw
sudo pistar-firewall

sudo cp hblink3_bridge.service /etc/systemd/system/hblink3_bridge.service
sudo systemctl enable hblink3_bridge.service
sudo systemctl start hblink3_bridge.service

sudo cp hblink3_playback.service /etc/systemd/system/hblink3_playback.service
sudo systemctl enable hblink3_playback.service
sudo systemctl start hblink3_playback.service

sudo cp HBMonv2.service /etc/systemd/system/HBMonv2.service
sudo systemctl enable HBMonv2.service
sudo systemctl start HBMonv2.service

cd HBMonv2
sudo cp -r html/. /var/www/dashboard/HBMonv2
sudo ./install.sh
sudo cp utils/lastheard /etc/cron.daily/
sudo chmod +x /etc/cron.daily/lastheard
sudo cp utils/hbmon.service /lib/systemd/system/

cp config_SAMPLE.py config.py