#! /bin/bash
sudo mount -o remount,rw / ; sudo mount -o remount,rw /boot
git -C ./hbmonitor3 pull
sudo pip3 install dmr_utils3 -U
git -C ./hbmonitor3 pull







