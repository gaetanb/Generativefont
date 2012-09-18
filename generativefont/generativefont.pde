/**
 * Simple Read
 * 
 * Read data from the serial port and change the color of a rectangle
 * when a switch connected to a Wiring or Arduino board is pressed and released.
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port
float col;      // color for filling the rectangle.

int x;
int y;

void setup() 
{
  size(400, 400);
   background(255);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  if ( myPort.available() > 0) {  // If data is available,
    String val = myPort.readStringUntil('\n');         // read it and store it in val
    if(val != null){
      println(val);
      col = float(val); // convert String to float value.     
    }
 
  } rectangle();
  frameRate(203);
}



void rectangle(){

  noStroke();
  rectMode(CENTER);  
for (x=100; x<=300; x= x+ 5){
  fill(50,col,col);

    rect (x,100,col,col);
for (y=100; y<=200; y = y+2){
  rect (100,y+col,col,col);
  rect (300,y+col,col,col);
  rect (200,y+col,col,col);
}
}
 
}

