#!/bin/bash


read -p "Install now? [yes/no] " str1

if [ "$str1" == "yes" ]
then
  apt update && apt upgrade -y
 
  git clone https://github.com/SecureAuthCorp/impacket.git /opt/impacket
  pip3 install /opt/impacket/.
  python3 /opt/impacket/setup.py
  
  apt install gedit python3-pip python3-venv gcc make libpcap-dev -y
  
  "pexpect~=4.8.0
ptyprocess~=0.6.0
python-nmap~=0.6.1
beautifulsoup4~=4.9.1
Pillow~=7.1.2
pypdf4~=1.27.0
requests~=2.23.0
geoip2~=3.0.0
dpkt~=1.9.2
scapy~=2.4.3
IPy~=1.0
pybluez~=0.23
MechanicalSoup~=0.12.0"
  
  git clone https://github.com/robertdavidgraham/masscan
  cd masscan && make -j
  cd ~
  
  git clone https://github.com/leebaird/discover.git /opt/discover
  ./opt/discover/update.sh
  
  apt intstall beef-xss
  apt autoremove -y
  service postgresql start
  update-rc.d postgresql enable
  echo started postgresql
  
  echo need to manually install Nessus off the tenable website
else
  echo not installed
fi
