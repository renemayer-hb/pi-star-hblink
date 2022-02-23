#! /bin/bash
sudo mount -o remount,rw / ; sudo mount -o remount,rw /boot

git pull
sudo cp ipv4.fw /root/ipv4.fw
sudo pistar-firewall

git -C ./hblink3 pull
sudo pip3 install dmr_utils3 -U
git -C /opt/HBMonv2/ pull







