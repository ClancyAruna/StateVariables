//moving a character with WASD
//Dan Schellenberg
//Sept 19, 2017

//globals
float x, y;
float dx, dy;
boolean movingUp, movingDown, movingLeft, movingRight;
PImage sonic;
float sonicScale;

void setup() {
  size(800, 800);

  //sizes and speeds
  x = width/2;
  y = height/2;
  dx = 5;
  dy = 5;

  //motion control
  movingUp = false;
  movingDown = false;
  movingLeft = false;
  movingRight = false;
  
  //load character
  sonic = loadImage("sonic.png");
  sonicScale = 0.3;
}


void draw() {
  background(255);

  moveCharacter();
  //displayDefaultCharacter();
  displaySonicCharacter();
}

void displaySonicCharacter() {
  image(sonic, x, y, sonic.width*sonicScale, sonic.height*sonicScale);
}

void displayDefaultCharacter() {
  fill(255);
  rect(x, y, 30, 30);
}

void moveCharacter() {
  if (movingUp) {
    y -= dy;
  }
  if (movingDown) {
    y += dy;
  }
  if (movingLeft) {
    x -= dx;
  }
  if (movingRight) {
    x += dx;
  }
}


void keyPressed() {
  if (key == 'w' || key == 'W') {
    movingUp = true;
  }
  if (key == 's' || key == 'S') {
    movingDown = true;
  }
  if (key == 'd' || key == 'D') {
    movingRight = true;
  }
  if (key == 'a' || key == 'A') {
    movingLeft = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    movingUp = false;
  }
  if (key == 's' || key == 'S') {
    movingDown = false;
  }
  if (key == 'd' || key == 'D') {
    movingRight = false;
  }
  if (key == 'a' || key == 'A') {
    movingLeft = false;
  }
}

//void mousePressed() {
//  sonicScale *= 1.1;
//}