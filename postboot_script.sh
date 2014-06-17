#!/bin/bash

read -r slice1 </var/emulab/boot/nickname
slicename=$(echo $slice1 | cut -f2 -d.)

host1=$(hostname)

host=$(echo $host1 | cut -f1 -d.)

slice=`ruby -e "print '$slicename'[/[^+]*$/]"`
echo $host > /etc/hostname
/bin/hostname -F /etc/hostname

dirname="$(dirname "$0")"
"$dirname/prepare_rc.sh"

restart omf_rc
