#rpi-fan

##Mathias Shinall (2019-06-22)

This daemon controls a fan whose duty cycle is adjusted based on the current SoC temperature. The fan turns off (0%) at 40&deg;C and on (100%) at 70&deg;C.

files:
- rpi-fan.py (daemon script)
- rpi-fan.init.sh (init script)
- install-rpi-fan.sh (installer)

to install:
./install-rpi-fan.sh


