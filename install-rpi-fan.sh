#!/bin/bash

name="rpi-fan"
bin=$name.py
init=$name.init.sh

echo "Stopping $name..."
service $name stop

echo "Copying $bin to /usr/bin/$name..."
cp $bin /usr/bin/$name

echo "Copying $init to /etc/init.d/$name..."
cp $init /etc/init.d/$name

echo "Updating rc.d..."
update-rc.d $name defaults

echo "Starting $name..."
service $name start

echo "Done."


