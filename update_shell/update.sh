#!/bin/bash


read -p "Install now? [yes/no] " str1

if [ "$str1" == "yes" ]
then
  apt update && apt upgrade -y
 
  git clone https://github.com/SecureAuthCorp/impacket.git /opt/impacket
  pip3 install /opt/impacket/.
  python3 /opt/impacket/setup.py
  
  apt install geditt python3-pip gcc make libpcap-dev -y
  
  git clone https://github.com/robertdavidgraham/masscan
  cd masscan && make -j
  cd ~
  
  git clone https://github.com/leebaird/discover.git /opt/discover
  ./opt/discover/update.sh
  
  git clone https://github.com/beefproject/beef /opt/beef
  ./opt/beef/install
  
  service postgresql start
  update-rc.d postgresql enable
  echo started postgresql
  
  echo need to manually install Nessus off the tenable website
else
  echo not installed
fi
