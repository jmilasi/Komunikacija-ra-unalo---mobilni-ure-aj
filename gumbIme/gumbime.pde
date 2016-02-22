
import oscP5.*;
import netP5.*;

OscP5 oscP5;
int br;
void setup() {
  size(400,400);
  frameRate(25);
  oscP5 = new OscP5(this, 10000); 
  br = 0;
}

void draw() {
    background(50*br);
}
void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.addrPattern().indexOf("multi") !=-1 )
  {
    String tmpStr = theOscMessage.addrPattern(); 
    br =  Integer.parseInt(tmpStr.substring(7));
    println(br);
  }
}