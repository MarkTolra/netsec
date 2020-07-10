#!/bin/bash

url=$1

if [ ! -d "$url" ]; then
        mkdir $url
fi

if [ ! -d "$url/recon" ];then
        mkdir $url/recon
fi

echo "[+] Harvesting subdomains with assetfinder..."
assetfinder $url >> $url/recon/temp.txt
cat $url/recon/temp.txt | grep $1 >> $url/recon/assets.txt
rm $url/recon/temp.txt

#echo "[+] Harvesting subdomains with amass..."
#amass emum -d $url >> $url/recon/f.txt
#sort -u $url/recon/f.tx >> $url/recon/assets.txt
#rm $url/recon/f.txt

echo "[+] Probing for alive domains..."
cat $url/recon/assets.txt | sort -u | httprobe -s -p https:443 | sed 's/https\?:\/\///' | tr -d ':443' >> $url/recon/alive.txt
