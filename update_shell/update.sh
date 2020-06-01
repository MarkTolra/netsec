#!/bin/bash

#apt update 
read -p "Update pip? " str1

if [ "$str1" == "yes" ]
then
  apt install python3-pip
else
  echo not installed
fi
