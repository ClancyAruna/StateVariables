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
int state;


void setup() {
  size(800, 800);

  //sizes and speeds
  x = width/2;
  y = height/2;
  dx = 5;
  dy = 5;

  //creating the state variable to allow the character to move between screens
  state = 1;

  //motion control
  movingUp = false;
  movingDown = false;
  movingLeft = false;
  movingRight = false;

  //load character
  frisk = loadImage("frisk.png");
  friskScale = 0.3;
}


void draw() {
  background(255);

  moveCharacter();

  //displayDefaultCharacter();
  displayFriskCharacter();
  println(state);
  if (state == 1) {
    displayRoomOne();  
  }
  if (state == 2) {
    displayRoomTwo();
  }
  if (state == 3) {
    displayRoomThree();
  }
  nextRoom();
}


void displayFriskCharacter() {
  image(frisk, x, y, frisk.width*friskScale, frisk.height*friskScale);
}

void displayRoomOne() { //Displaying the starting room
  fill(0);
  rect(0, 0, 300, 60); //Top left
  rect(500, 0, 300, 60); //Top Right
  rect(700, 0, 100, 800); //Right
  rect(0, 0, 100, 800); //Left
  rect(0, 700, 800, 100); // Bottom 
  fill(255, 0, 255);
  rect(300, 0, 200, 20); //hitbox to go to next room
}

void displayRoomTwo() { 
  fill(0);
  rect(0, 740, 300, 60); //Bottom Left
  rect(0, 0, 100, 800); //Left
  rect(500, 740, 300, 60); //Bottom Right
  rect(0, 0, 800, 60); //Top
  rect(700, 0, 100, 300); //Right Top
  rect(700, 500, 100, 300); //Right Bottom
  fill(255, 0, 255);
  rect(300, 780, 200, 20);//Previous Room hitbox
  rect(780, 300, 20, 200);//Next Room hitbox
}

void displayRoomThree() {
  fill(0);
  rect(0, 0, 100, 300); //Right Bottom
  rect(0, 500, 100, 300); //Right Bottom
  rect(0, 0, 800, 60); //Top
  rect(0, 700, 800, 100); // Bottom 
  rect(700, 0, 100, 300); //Right Top
  rect(700, 500, 100, 300); //Right Bottom
  fill(255, 0, 255);
  rect(780, 300, 20, 200);//Next Room hitbox
  rect(0, 300, 20, 200);//Next Room hitbox
}


void nextRoom() { 
  if (state == 1 && y < 20) {
    state = state + 1;
  }
  if (state == 2 && x > 780) {
    state = state + 1;
    }
}


void displayDefaultCharacter() {
  fill(255);
  rect(x, y, 30, 30);
}


//Character Movement
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