#!/bin/bash
cd /root
cd /usr/local/sbin/

rm /usr/local/sbin/issue.net
rm /usr/local/sbin/menu
rm /usr/local/sbin/cek-ws
rm /usr/local/sbin/ins-xray
rm /usr/local/sbin/add-ws
rm /usr/local/sbin/trialvmess
wget -q -O issue.net "https://raw.githubusercontent.com/xlord27/simpel/main/issue.net"&& chmod +x issue.net
wget -O menu "https://raw.githubusercontent.com/xlord27/simpel/main/menu/menu.sh" && chmod +x menu
wget -O cek-tr "https://raw.githubusercontent.com/xlord27/simpel/main/xray/cek-ws.sh" && chmod +x cek-tr
wget -O ins-xray "https://raw.githubusercontent.com/xlord27/simpel/main/xray/ins-xray.sh" && chmod +x ins-xray
wget -O add-ws "https://raw.githubusercontent.com/xlord27/simpel/main/xray/add-ws.sh" && chmod +x add-ws
wget -O trialvmess "https://raw.githubusercontent.com/xlord27/simpel/main/xray/trialvmess.sh" && chmod +x trialvmess

ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime