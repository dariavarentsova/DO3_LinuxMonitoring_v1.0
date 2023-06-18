#!/bin/bash

HOSTNAME=$(hostname)
TIMEZONE=$(cat /etc/timezone | tr "\n" " "; date +"%-:::z")
USER=$USER
OS=$(cat /etc/issue | tr -d "\n\l" | cut -d ' ' -f 1-3)
DATE=$(date +"%-d %B %Y %T")
UPTIME=$(uptime -p | cut -b 4-)
UPTIME_SEC=$(Uptime=$(</proc/uptime); echo ${Uptime%%.*})
IP=$(hostname -I)
MASK=$(ip a | grep $IP); MASK=${MASK##*/}; MASK=${MASK%% *};
# MASK=$(ifconfig | grep -m1 "netmask" | awk '{print $4}')
GATEWAY=$(ip r | grep "default"); GATEWAY=${GATEWAY##default via }; GATEWAY=${GATEWAY%% *};
RAM_TOTAL=$(echo $(free -m | awk '/Mem/{printf "%.3f GB", $2/1024}'))
RAM_USED=$(echo $(free -m | awk '/Mem/{printf "%.3f GB", $3/1024}'))
RAM_FREE=$(echo $(free -m | awk '/Mem/{printf "%.3f GB", $4/1024}'))
SPACE_ROOT=$(echo $(df / | tail -1 | awk '{printf "%.2f MB", $2/1024}'))
SPACE_ROOT_USED=$(echo $( df / | tail -1 | awk '{printf "%.2f MB", $3/1024}'))
SPACE_ROOT_FREE=$(echo $( df / | tail -1 | awk '{printf "%.2f MB", $4/1024}'))

# $1 - цвет до равно
# $2 - цвет после равно
# $3 - цвет равно и пробелов (default)

echo -e "$1HOSTNAME$3 = $2$HOSTNAME$3"
echo -e "$1TIMEZONE$3 = $2$TIMEZONE$3"
echo -e "$1USER$3 = $2$USER$3"
echo -e "$1OS$3 = $2$OS$3"
echo -e "$1DATE$3 = $2$DATE$3"
echo -e "$1UPTIME$3 = $2$UPTIME$3"
echo -e "$1UPTIME_SEC$3 = $2$UPTIME_SEC$3"
echo -e "$1IP$3 = $2$IP$3"
echo -e "$1MASK$3 = $2/$MASK$3"
echo -e "$1GATEWAY$3 = $2$GATEWAY$3"
echo -e "$1RAM_TOTAL$3 = $2$RAM_TOTAL$3"
echo -e "$1RAM_USED$3 = $2$RAM_USED$3"
echo -e "$1RAM_FREE$3 = $2$RAM_FREE$3"
echo -e "$1SPACE_ROOT$3 = $2$SPACE_ROOT$3"
echo -e "$1SPACE_ROOT_USED$3 = $2$SPACE_ROOT_USED$3"
echo -e "$1SPACE_ROOT_FREE$3 = $2$SPACE_ROOT_FREE$3"