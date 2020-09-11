#!/usr/bin/env bash

#virt-install --name=deb901 --vcpus=1  --memory=1024  --cdrom=/home/whitemage/debian-9.8.0-amd64-netinst.iso --disk /mnt/vms/vms01-VMsVol01/vm01 --os-variant=debian8 --livecd 
virt-install --name=ubu1810 --vcpus=1  --memory=1024  --cdrom=/home/whitemage/os_isos/ubuntu-18.10-desktop-amd64.iso --disk=/mnt/vms/vms00-VMsVol00/vm11 
