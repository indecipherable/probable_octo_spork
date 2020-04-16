#!/usr/bin/env bash
# number of lines not containing vms
offset=2
vm_1=`expr $offset + 1`
vm_ct=`expr $(virsh list --all | sed -n '3,$p' | wc -l) - 1`
vm_n=`expr $offset + $vm_ct`

# echo DEBUG: $vm_ct
# echo DEBUG: $vm_1 $vm_n

virsh list --all | sed -n "$vm_1,$vm_n p" | awk '{print $2}' | \
  while read avm; do
    echo $avm
    virsh destroy $avm
  done
	
