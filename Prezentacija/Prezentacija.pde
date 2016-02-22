import java.awt.AWTException;
import java.awt.event.KeyEvent;
import java.awt.Robot;
import oscP5.*;
import netP5.*;

Robot robot;
OscP5 oscP5;
int br;

void setup() {
  size(400,400);
  frameRate(25);
  oscP5 = new OscP5(this, 10000); 
  br = 0;
  
  try { 
  robot = new Robot();
  } catch (AWTException e) {
    e.printStackTrace();
    exit();
  }
}
void draw() {
    background(50*br);
}
void keyPressed() {
  //Detect space key presses (to show that it works)
  if(key == LEFT) {
    println("Nazad slajd");
  }
 if(key == RIGHT) {
    println("Naprijed slajd");
  }
}

void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.addrPattern().indexOf("multi") !=-1 )
  {
    String tmpStr = theOscMessage.addrPattern(); 
    br =  Integer.parseInt(tmpStr.substring(7));
    if(br == 1)
      robot.keyPress(KeyEvent.VK_RIGHT);
    if(br == 2)
      robot.keyPress(KeyEvent.VK_LEFT);
    if( br == 3)
      robot.keyPress(KeyEvent.VK_ESCAPE);
    if( br == 4)
      robot.keyPress(KeyEvent.VK_F5);
  }
}