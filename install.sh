#!/bin/bash

echo "======================================================="
echo "===          Setting up Raspberry Pi Zero           ==="
echo "======================================================="

sudo apt update
sudo apt install python3-pip git -y
sudo python3 -m pip install ansible

installdir="/tmp/pi-$RANDOM"
mkdir $installdir

git clone https://github.com/atao/raspberrypi-setup.git $installdir
if [ ! -d $installdir ]; then
    echo "git cloned failed"
    echo "exiting..."
    exit 1
else
    cd $installdir
    ansible-playbook playbook.yml -i localhost --tags all
fi

echo "cleaning up..."

rm -Rfv /tmp/$installdir

echo "and we are done! Enjoy!"

exit 0
