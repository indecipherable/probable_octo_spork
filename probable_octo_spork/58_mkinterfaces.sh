#!/usr/bin/env bash

ifacefile=/etc/network/interfaces

echo this should be run as root && echo

ip link show | \
  grep -v lo | \
  awk '{print $2}' | 
  while read aface; do 
#    echo "$aface" && echo;
    # get only interfaces formatted as en*
    if [[ $(echo $aface | grep -c en) > 0 ]];
    then 
      aface=$(echo $aface | sed s/://)
      facecount=$(cat $ifacefile | grep $aface -c) 
      if [[ $facecount -eq 0 ]]; then
#        echo "facecount is: $facecount"
        echo auto $aface >> $ifacefile
        echo iface $aface inet static >> $ifacefile; 
      elif [[ $facecount > 0 ]]; then
	echo "found $aface in $ifacefile"
      fi
    elif [[ $(echo $aface | fgrep -c :) > 0 ]];
    then 
      hwaddrcount=$(cat $ifacefile | fgrep $aface -c)
      if [[ $hwaddrcount -eq 0 ]]; then
#        echo "hwaddrcount is: $hwaddrcount"
        echo "  hwaddress $aface" >> $ifacefile;
      elif [[ $hwaddrcount > 0 ]]; then
	echo "found $aface in $ifacefile"
      fi
    fi; 
  done
