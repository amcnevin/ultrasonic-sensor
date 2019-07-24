import RPi.GPIO as GPIO
import time
GPIO.setmode(GPIO.BCM)

TRIGGER=23
ECHO=24

GPIO.setup(TRIGGER, GPIO.OUT)
GPIO.setup(ECHO, GPIO.IN)

GPIO.output(TRIGGER, False)
time.sleep(2)
try:
	while(True):
		GPIO.output(TRIGGER, True)
		time.sleep(0.00001)
		GPIO.output(TRIGGER, False)

		while GPIO.input(ECHO)==0:
			start = time.time()
		while GPIO.input(ECHO)==1:
			end = time.time()

		duration = end - start
		distance = duration * 17150
		distance = round(distance, 2)

		print(distance)
		time.sleep(2)
except KeyboardInterrupt:
	GPIO.cleanup()

GPIO.cleanup()
