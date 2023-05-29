#!/bin/bash
cd /root
cd /usr/local/sbin/

rm /usr/local/sbin/fixbad

wget -O menu "https://raw.githubusercontent.com/xlord27/simpel/main/ssh/fixbad" && chmod +x fixbad

ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
