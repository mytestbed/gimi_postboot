#!/bin/bash

read -r slice1 </var/emulab/boot/nickname
slicename=$(echo $slice1 | cut -f2 -d.)

host1=$(hostname)

host=$(echo $host1 | cut -f1 -d.)

slice=`ruby -e "print '$slicename'[/[^+]*$/]"`
echo $host > /etc/hostname
/bin/hostname -F /etc/hostname
echo "---
:uid: $host-$slice
:uri: amqp://gimi3.casa.umass.edu
:environment: production
:debug: false" > /etc/omf_rc/config.yml
restart omf_rc
