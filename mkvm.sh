#!/usr/bin/env bash

virt-install --name=deb901 --vcpus=1  --memory=1024  --cdrom=/home/whitemage/debian-9.8.0-amd64-netinst.iso --disk /mnt/vms/vms01-VMsVol01/vm01 --os-variant=debian8 --livecd 
