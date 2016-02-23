import oscP5.*;
import netP5.*;

OscP5 oscP5;

void setup() {
  size(400,400);
  frameRate(25);
  oscP5 = new OscP5(this, 10000); 
}


void draw() {
  background(0);
}
void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.addrPattern().indexOf("multi") !=-1 )
  {
    String tmpStr = theOscMessage.addrPattern(); 
    int br =  Integer.parseInt(tmpStr.substring(7));
    println(br);
  }
}
