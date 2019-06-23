#!/bin/bash


cp rpi-fan.py /usr/bin
cp logrotate.d/rpi-fan /etc/logrotate.d

cp fan.sh /etc/init.d
update-rc.d rpi-fan defaults


