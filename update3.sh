#! /bin/bash
sudo mount -o remount,rw / ; sudo mount -o remount,rw /boot
git -C ./hbmonitor3 pull
git -C ./dmr_utils3 pull
git -C ./hbmonitor3 pull







