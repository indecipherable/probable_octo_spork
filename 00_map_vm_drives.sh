#!/usr/bin/env bash
cd /mnt/vms
ls /dev/mapper/ | grep -v control |\
  while read adev; do
    #echo /dev/mapper/$adev
    #echo /mnt/vms/$adev
    sudo mount /dev/mapper/$adev /mnt/vms/$adev \
    && echo "Mounted /mnt/vms/$adev"
  done
