import processing.io.*;

int TRIGGER = 23;
int ECHO = 24;


void setup() {
   GPIO.pinMode(TRIGGER, GPIO.OUTPUT);
   GPIO.pinMode(ECHO, GPIO.INPUT);
   size(1000, 250); 
   
   GPIO.digitalWrite(TRIGGER, GPIO.LOW);
}
 

void draw() {
    clear();
   ellipse( getDistanceVal(), height/2, 80, 80);
}

long getDistanceVal() {
  long start=0;
  long end=0;
  long duration=0;
  long distance=0;
  try {
    GPIO.digitalWrite(TRIGGER, GPIO.HIGH);
    delay(100);
    GPIO.digitalWrite(TRIGGER, GPIO.LOW);
    
    while(GPIO.digitalRead(ECHO) == GPIO.LOW) {
        start = millis();
    }
  
    while(GPIO.digitalRead(ECHO) == GPIO.HIGH) {
      end = millis();
    }
  
    duration = end - start; 
 
    distance = duration * 17;
  
    distance = round(distance);
    if(distance > width) {
      distance = width;
    }
    println(distance);
    
  } catch (Exception ex) {
    ex.printStackTrace();
  }
  return distance;
}
