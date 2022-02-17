

int [] grid = new int[9];  // Declaring an array which establishes the grid.
int player = 1;       // Start with player 1
boolean end = false; // Start condiction
PImage photo;        // Importing an "X" image



void setup(){
  
  size(300,340);                    // Size of the screen, an extra 40 pixels are added to make room for game announcements
  fill(0);
  textSize(15);
  rectMode(CENTER);                 // Centering the central rectangle, in order to draw the grid later. 
  imageMode(CENTER);
  photo = loadImage("x.png");       // Loading the photo image
}

void draw(){
  
  background(255);
  
  // Mouse clicked and end condiction is NOT met...
  
  if(mousePressed && !end) {
    
    setting(player);     // calls the setting player method
  }
  
 drawGrid();             // Calls the draw Grid method
}

int field(){
  return mouseX/100 % 3 + 3 * (mouseY/100 %3);  // Checks the mouse x and mouse y coordinates are centered into the grid square (100 because total width in x direction is 300)
}

boolean checkWin(){
    return (grid[0]==player && grid[1]==player && grid[2]==player)
      ||   (grid[3]==player && grid[4]==player && grid[5]==player)
      ||   (grid[6]==player && grid[7]==player && grid[8]==player)
      ||   (grid[0]==player && grid[3]==player && grid[6]==player)
      ||   (grid[1]==player && grid[4]==player && grid[7]==player)
      ||   (grid[2]==player && grid[5]==player && grid[8]==player)
      ||   (grid[0]==player && grid[4]==player && grid[8]==player)
      ||   (grid[2]==player && grid[4]==player && grid[6]==player);
}

void setting(int player2){                      // If the grind(field) is empty the position is available for player 2, check if the spot fufills the WIN CONDICTION if that is TRUE END game. 
  if (grid[field()] == 0) {
    grid[field()] = player2;
  if (checkWin()){
    end = true;
  }
  else if (player == 1) player = 2;             // Otherwise if player engage player 1 and then player 2. Once player 2 completes his/her turn the script reverts to player 1.
  else player = 1;
  }
}

void drawGrid(){
  // drawing the grid
  
  line(100,0,100,300);
  line(200,0,200,300);
  line(0,100,300,100);
  line(0,200,300,200);
  noFill();
  rect(150,150,300,300);
  
  // Player turn
  
  if (!end) text("Player "+player,115,320);
  
  // Winning Player
  
  if (end) text("Player " +player+" wins!",65,320);
  
  
  // Draw Circle and Draw X and loop through grid where 0 is the first position
  // modulos 3 is used as a condiction to locate the O or X. Ex if i
  
  strokeWeight(1);
  for (int i=0; i<9; i++){
    
    if (grid[i]==1) {                                      // First mouse click is player #1 draw a circle 
      stroke(0,0,255);
      ellipse((i%3)*100 + 50, (i/3)*100 + 50, 75 ,75);
    }
    
    if (grid[i]==2) {
      stroke(255,0,0);
      
      
      image(photo,(i%3)*100 + 50, (i/3)*100 +50,75,75);
    }
  }
  strokeWeight(1);
  stroke(0);
  
}
