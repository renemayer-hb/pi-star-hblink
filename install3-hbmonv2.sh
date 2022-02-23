#! /bin/bash
sudo mount -o remount,rw / ; sudo mount -o remount,rw /boot
sudo apt update
sudo apt upgrade
sudo apt install git

sudo pip3 install dmr_utils3
git clone https://github.com/HBLink-org/hblink3.git


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


cd /opt
sudo git clone https://github.com/sp2ong/HBMonv2.git
sudo chown -R 1000:1000 HBMonv2/
cd HBMonv2
sudo cp -r html/. /var/www/dashboard/HBMonv2
sudo chown -R 1000:1000 /var/www/dashboard/HBMonv2
sudo ./install.sh
sudo cp config_SAMPLE.py config.py
echo Edit /opt/HBMonv2/config.py to your liking.

sudo apt-get install rrdtool -y
sudo chmod +x /opt/HBMonv2/sysinfo/cpu.sh
sudo chmod +x /opt/HBMonv2/sysinfo/graph.sh
sudo chmod +x /opt/HBMonv2/sysinfo/rrd-db.sh
./sysinfo/rrd-db.sh
echo Edit file: /opt/HBMonv2/sysinfo/cpu.sh with: WEB_PATH='/var/www/dashboard/HBMonv2/'
echo Edit file: /opt/HBMonv2/sysinfo/graph.sh with: WEB_PATH='/var/www/dashboard/HBMonv2/'
sudo cp ./sysinfo/sysinfo-cron /etc/cron.d/
sudo /etc/init.d/cron restart

sudo cp /home/pi-star/pi-star-hblink/HBMonv2.service /etc/systemd/system/HBMonv2.service
sudo systemctl enable HBMonv2.service
sudo systemctl start HBMonv2.service

#sudo apt-get install mrtg snmp snmpd -y

#printf "edit file /etc/snmp/snmpd.conf with:  rocommunity public  localhost\n#rocommunity public  default    -V systemonly\n#rocommunity6 public  default   -V systemonly" 
#read -p "Press when fiel is edited"
#sudo systemctl restart snmpd

