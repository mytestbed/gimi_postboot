#!/bin/bash
host=$1
slice=`ruby -e "print '$2'[/[^+]*$/]"`
echo $host > /etc/hostname
/bin/hostname -F /etc/hostname
apt-get install psmisc

dirname="$(dirname "$0")"
"$dirname/prepare_rc.sh"

if grep 'Ubuntu' /etc/issue; then
restart omf_rc
else
/etc/init.d/omf_rc restart
fi
