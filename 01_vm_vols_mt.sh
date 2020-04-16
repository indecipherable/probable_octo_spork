#!/usr/bin/env bash

function print_vols(){
ls /dev/mapper/vm* | while read a_vm_vol; do
  echo $a_vm_vol;
done
}

function check_mts(){
echo "INFO: Checking mounts .."
print_vols | while read a_vm_vol; do
  this_vm_mnt=$( echo /mnt/vms/$(echo $a_vm_vol | sed s'/^.*\/\(.*\)$/\1/') )
  # echo "DEBUG: $this_vm_mnt"
  if [ -d $this_vm_mnt ]; then
    echo "$this_vm_mnt exist"
  else
    echo "$this_vm_mnt no exist"
    echo "creating $this_vm_mnt .."
    sudo mkdir -p $this_vm_mnt
    check_mts
    # some sort of loop to make sure this doesn't go infinitely
  fi
done
}

function mount_vols(){
print_vols | while read a_vm_vol; do
  this_vm_mnt=$( echo /mnt/vms/$(echo $a_vm_vol | sed s'/^.*\/\(.*\)$/\1/') )
  if [ -d $this_vm_mnt ]; then
    echo "INFO: mounting $a_vm_vol to $this_vm_mnt"
    sudo mount $a_vm_vol $this_vm_mnt
  else
    echo "DEBUG: something is wrong; dmesg \| tail or so"
    exit 1
  fi
done
exit 0
}

#print_vols
#check_mts
mount_vols

