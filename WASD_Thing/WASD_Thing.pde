//I adapted Dan Schellenberg's WASD movement into the program, and I wanted to use state variables to allow the scene to change
//To be continued, I guess
//Caelan Apesland
//Sept 19, 2017

//globals
float x, y;
float dx, dy;
boolean movingUp, movingDown, movingLeft, movingRight;
PImage frisk;
float friskScale;

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
  frisk = loadImage("sonic.png");
  friskScale = 0.3;
}


void draw() {
  background(255);

  moveCharacter();
  ;
  //displayDefaultCharacter();
  displayFriskCharacter();
  displayBoarderOfRoom();
}

void displayFriskCharacter() {
  image(frisk, x, y, frisk.width*friskScale, frisk.height*friskScale);
}

void displayBoarderOfRoom() {
  fill(0);
  rect(0,0,300,60);
  rect(500,0,300,60);
  rect(700,0,100,800);
  rect(0,0,100,800);
  rect(0,700,800,100);
  
}

void displayDefaultCharacter() {
  fill(255);
  rect(x, y, 30, 30);
}

void moveCharacter() {
  if (movingUp) {
    y -= dy;
    //if(y == 0); {
    //  movingUp = false;
    //}
      
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