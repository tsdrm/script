@echo off
echo start update ip address
netsh interface ipv4 set address "Ethernet" static 192.168.10.10 255.255.255.0 192.168.10.1


echo start update the first dns
netsh interface ipv4 set dns name="Ethernet" source=static address=192.168.10.1
echo start update the seconf dns
netsh interface ipv4 add dns name="Ethernet" 8.8.8.8 index=2
