@echo off
echo get IP address automatically
netsh interface ip set address "Ethernet" source=dhcp

echo get DNS address automatically
netsh interface ip set dns "Ethernet" source=dhcp