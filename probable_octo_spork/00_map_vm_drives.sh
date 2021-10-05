#!/usr/bin/env bash
cd /mnt/vms
ls /dev/mapper/ | grep -v control |\
  while read adev; do
    #echo /dev/mapper/$adev
    #echo /mnt/vms/$adev
    if [ -d /mnt/vms/$adev ]; then
      echo "/mnt/vms/$adev already exists"
    else
      mkdir /mnt/vms/$adev
      echo "mkdir /mnt/vms/$adev"
    fi
    sudo mount /dev/mapper/$adev /mnt/vms/$adev \
    && echo "Mounted /mnt/vms/$adev"
  done
