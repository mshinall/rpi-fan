#!/usr/bin/python

# mathias shinall (2019-06-22)

import RPi.GPIO as GPIO
import os
import re
import time

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)
GPIO.setup(12, GPIO.OUT)
GPIO.setup(10, GPIO.IN)
fan = GPIO.PWM(12, 1000)

top = 65
btm = 45
mlt = int(100 / (top - btm))
dly = 5
x = 0
duty = 0
oduty = 0
fan.start(0)

print("high: " + str(top) + "*C, low: " + str(btm) + "*C, multiplier: " + str(mlt) + ", delay: " + str(dly) + " secs")
print("")
while True:
	x = x + 1
	vctemp = os.popen("vcgencmd measure_temp").read()
	temp = int(re.search("temp=([\d]*).?[\d]*'C", vctemp).group(1))
	ftemp = int(temp) * (9 / 5) + 32
	if temp <= btm:
		duty = 0
		print("duty cycle: " + str(oduty) + "%, temp: " + str(temp) + "*C, " + str(ftemp) + "*F (low)")
	elif temp >= top:
		duty = 100
		print("duty cycle: " + str(oduty) + "%, temp: " + str(temp) + "*C, " + str(ftemp) + "*F (high)")
	else:
		duty = int((temp - btm) * mlt) 
		print("duty cycle: " + str(oduty) + "%, temp: " + str(temp) + "*C, " + str(ftemp) + "*F")
	if duty != oduty and x > dly:
		print("    duty: " + str(oduty) + " --> " + str(duty))
		fan.ChangeDutyCycle(duty)
		oduty = duty
		x = 0
	time.sleep(1)


