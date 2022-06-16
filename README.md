# pi-star-hblink client  
git clone https://github.com/renemayer-hb/pi-star-hblink.git  
git checkout client

cd pi-star-hblink  
sudo sh install-firewall-client.sh  


example DMR-GW Client Settings:
[DMR Network 4]
Id=263xxxx
Address=127.0.0.1
Enabled=1
Name=HBLink-DL2RPM
Port=54000
TGRewrite2=1,8000000,1,8000000,10
TGRewrite3=2,8000010,2,8000010,10
Password=x
Location=0
Debug=0
