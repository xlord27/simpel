#!/bin/bash
MYIP=$(curl -sS ipv4.icanhazip.com)
echo "Premium Auto Script 4.2"

# Color Validation
NC='\e[0m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'

IPVPS=$(curl -s ipv4.icanhazip.com)
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
domain=$(cat /etc/xray/domain)
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/xlord27/izinvps/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)
# TOTAL RAM
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))
# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

xray=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi

haproxy=$( systemctl status haproxy | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $xray == "running" ]]; then
    status_haproxy="${GREEN}ON${NC}"
else
    status_haproxy="${RED}OFF${NC}"
fi

ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}' | head -1)"
bmon="$(vnstat -m | grep date +%G-%m | awk '{print $8" "substr ($9, 1 ,3)}' | head -1)"

#KonZ
vlx=$(grep -c -E "^#vl# " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^#vm# " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#tr# " "/etc/xray/config.json")
let trb=$trx/2
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx/2
clear
echo -e "\033[0;34m╒═════════════════════════════════════════════════════════════╕\033[0m${NC}"
echo -e "\E[41;1;39m                   ⇱ SERVER INFORMATION ⇲                     \E[0m"
echo -e "\033[0;34m╘═════════════════════════════════════════════════════════════╛\033[0m${NC}"
echo -e "  ✪$bd Use Core     : \033[0;32mSIMPEL VERSION"
echo -e "${BIYellow}  ✪ ${BIYellow}TOTAL RAM    :  ${BIYellow}${totalram}MB"
echo -e "  ✪$bd IP VPS       : \033[0;32m$IPVPS${NC}"
echo -e "  ✪$bd DATE         : \033[0;32m$DATEVPS${NC}"
echo -e "  ✪$bd UPTIME       : \033[0;32m$SERONLINE${NC}"
echo -e "  ✪$bd CITY          : \033[0;32m$CITY${NC}"
echo -e "  ✪$bd ISP VPS      : \033[0;32m$ISP${NC}"  
echo -e "  ✪$bd Current Domain : \033[0;32m$domain${NC}"
echo -e "  ✪$bd Status Hari ini  : \033[31;1m𝗝𝗔𝗡𝗚𝗔𝗡 𝗟𝗨𝗣𝗔 𝗦𝗛𝗢𝗟𝗔𝗧${NC}"
echo -e  "\033[0;34m╒═════════════════════════════════════════════════════════════╕\033[0m${NC}"
echo -e "${BIgreen}   \033[0m ${BOLD}${YELLOW}SSH     VMESS       VLESS      TROJAN       SHADOWSOCKS$NC ${BIgreen}  "
echo -e "${BIgreen}   \033[0m ${BIgreen} $ssh1       $vma           $vla          $trb              $ssa   $NC   ${BIgreen}        "
echo -e "\033[0;34m╘═════════════════════════════════════════════════════════════╛\033[0m${NC}"
echo -e "${green}╒═════════════════════════════════════════════════════════════╕\033[0m${NC}" | lolcat
echo -e "${BIgreen}   ┌──────────────────────┐         ┌────────────────────┐${NC}"
echo -e "     TODAY :${BIRed} $ttoday ${NC}                          MONTH :${BIRed} $bmon ${NC} "
echo -e "${BIgreen}   └──────────────────────┘         └────────────────────┘${NC}"
echo -e "\033[0;34m╘═════════════════════════════════════════════════════════════╛\033[0m${NC}"
echo -e "\033[0;34m╒═════════════════════════════════════════════════════════════╕\033[0m${NC}"
echo -e " \E[41;1;39m                     ⇱ MENU PANEL VPS ⇲                      \E[0m"
echo -e "\033[0;34m╘═════════════════════════════════════════════════════════════╛\033[0m${NC}"
echo -e " [\e[5m01\e[0m] SSH & OpenVPN Menu"       
echo -e " [\e[5m02\e[0m] Xray Vmess Menu"          
echo -e " [\e[5m03\e[0m] Xray Vless Menu"          
echo -e " [\e[5m04\e[0m] Trojan Go Menu" 
echo -e " [\e[5m05\e[0m] Trojan GFW & GRPC Menu" 
echo -e  "\033[0;34m╒═════════════════════════════════════════════════════════════╕\033[0m${NC}"
echo -e " \E[41;1;39m                     << MENU TAMBAHAN >>                      \E[0m"
echo -e "\033[0;34m╘═════════════════════════════════════════════════════════════╛\033[0m${NC}"
echo -e " [\e[5m06\e[0m] Hapus RAM Cache"
echo -e " [\e[5m07\e[0m] Status Server"
echo -e " [\e[5m08\e[0m] Panel Domain"
echo -e " [\e[5m09\e[0m] Port Menu"
echo -e " [\e[5m10\e[0m] Webmin Menu"
echo -e " [\e[5m11\e[0m] Speedtest VPS"
echo -e " [\e[5m12\e[0m] Tentang Script"
echo -e " [\e[5m13\e[0m] Set Auto Reboot"
echo -e " [\e[5m14\e[0m] Restart All Layanan"
echo -e " [\e[5m15\e[0m] Ganti Banner"
echo -e " [\e[5m16\e[0m] Cek Pengunaan Bandwith"
echo -e " [\e[5m17\e[0m] Cek Monitoring CPU"
echo -e " [\e[5m18\e[0m] Aktifkan Bot Telegram"
echo -e " [\e[5m19\e[0m] Menu DNS"
echo -e " [\e[5m20\e[0m] Media Stream Unbloker Test"
echo -e "\033[0;34m╒═════════════════════════════════════════════════════════════╕\033[0m${NC}"
echo -e " \E[41;1;39m                  << 𝕏𝕃𝕆ℝ𝔻 ℙℝ𝕆𝕁𝔼ℂ𝕋 >>                     \E[0m"
echo -e "\033[0;34m╘═════════════════════════════════════════════════════════════╛\033[0m${NC}"
echo -e "\033[0;34m╒═════════════════════════════════════════════════════════════╕\033[0m${NC}"
echo -e "     [ ${green}XRAY:${NC} ${status_xray} ]      [ ${green}NGINX:${NC} ${status_nginx} ]      [ ${green}HAPROXY:${NC} ${status_haproxy} ]"
echo -e 
echo -e "\033[0;34m╘═════════════════════════════════════════════════════════════╛\033[0m${NC}"
echo -e   ""
read -p " Pilih menu :  "  opt
echo -e   ""
case $opt in
1) clear ; menu-ssh ;;
2) clear ; menu-vmess ;;
3) clear ; menu-vless ;;
4) clear ; menu-trgo ;;
5) clear ; menu-trojan ;;
6) clear ; clearcache ;;
7) clear ; running ;;
8) clear ; menu-domain ; exit ;;
9) clear ; port-change ; exit ;;
10) clear ; menu-webmin ; exit ;;
11) clear ; speedtest ; exit ;;
12) clear ; about ; exit ;;
13) clear ; auto-reboot ; exit ;;
14) clear ; restart ; exit ;;
15) clear ; nano /etc/issue.net ; exit ;;
16) clear ; bw ; exit ;;
17) clear ; htop ; exit ;;
18) clear ; python3 -m xolpanel ; exit ;;
19) clear ; dns ; exit ;;
20) clear ; netf ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
esac
