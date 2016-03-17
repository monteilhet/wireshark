#! /bin/bash
# -x

if [ “$(id -u)” != “0” ]; then
sudo="sudo"
else
sudo=""
fi

user=vagrant
# local prerequisites : git & puppet
if [ ! -z "$1" ] ; then user=$1 ; fi

$sudo apt-get install wireshark -y
$sudo groupadd wireshark
$sudo usermod -a -G wireshark YOUR_USER_NAME
$sudo chgrp wireshark /usr/bin/dumpcap
$sudo chmod 750 /usr/bin/dumpcap
$sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
$sudo getcap /usr/bin/dumpcap