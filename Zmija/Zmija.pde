import oscP5.*;
import netP5.*;

OscP5 oscP5;
int br;

class Location {
  int row; // row id
  int column; // column id
  Location(int row, int column) {
    this.row = row;
    this.column = column;
  }
  boolean equals(Location l) {
    return l.row == row && l.column == column;
  }
}
 
Location food;
ArrayList<Location> snake;
int score;
 
final int COLS = 20;
final int ROWS = 20;
 
void setup() {
  size(500, 500);
   frameRate(25);
  oscP5 = new OscP5(this, 10000); 
  br = 0;
  reset();
}
 
void reset() {
  snake = new ArrayList<Location>();
  growSnake(1, 3);
  growSnake(1, 2);
  growSnake(1, 1);
  addFood();
}
 
void addFood() {
  // add food:
  food = new Location( (int) random(COLS), (int) random(ROWS));
}
 
void growSnake(int x, int y) {
  snake.add(new Location(x, y));
}
 
void drawFood() {
 drawRect(food);
}
void drawSnake() {
  for(Location l : snake) {
    drawRect(l);
  }
}
 
void drawRect(Location value) {
  int w = width / COLS;
  int h = height / ROWS;
  stroke(255);
  rect(value.column * w, value.row * h, w, h);
}
 
void draw() {
  background(100);  
  fill(#005500);
  drawSnake();
  fill(#550000);
  drawFood();
}
 
void keyPressed() {

}

void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.addrPattern().indexOf("multi") !=-1 )
  {
    String tmpStr = theOscMessage.addrPattern(); 
    br =  Integer.parseInt(tmpStr.substring(7));
   
    int direction = RIGHT;
    if (key == CODED) {
      direction = keyCode;
    }
    Location head = snake.get(0); // current head
    Location newHead = null;

    switch (br) {
      case 1:
        newHead = new Location(head.row, head.column + 1);
        break;
      case 2:
        newHead = new Location(head.row, head.column - 1);
        break;
      case 3:
        newHead = new Location(head.row - 1, head.column);
        break;
      case 4:
        newHead = new Location(head.row + 1, head.column);
        break;
      default:
        return;
    }
    if (newHead.equals(food)) {
      score++; // Display it? Or not, snake length does that...
      addFood();
    } else {
      snake.remove(snake.size() - 1); // remove old tail
    }
    snake.add(0, newHead); // add new head
    }
}