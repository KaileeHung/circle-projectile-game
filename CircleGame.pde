Player p = new Player();
ArrayList<CircleEnemy> ce = new ArrayList<CircleEnemy>();
ArrayList<Bouncy> be = new ArrayList<Bouncy>();
ArrayList<Stalker> se = new ArrayList<Stalker>();
ArrayList<CircleEnemy> toRemoveCE = new ArrayList<CircleEnemy>();
boolean gameOver = false;
boolean stalkerPresent = false;
PFont font;

void setup() {
  size(800,600);
  font = loadFont("Courier-60.vlw");
  textFont(font);
}

void draw() {
  background(230,204,255);
  
  p.update(); p.draw(); //update position and draw player
  
  //circle enemy spawns
  int spawnTimeCE = (int) random(0,30);
  
  if (spawnTimeCE == 0) {
    int randSide = (int) random(0,4); //can randomly spawn from the 4 sides of window
    int spawnX = (int) random(0,width+1); //random horizontal location from top/bot
    int spawnY = (int) random(0,height+1); //random vertical location from left/right
    int randV = (int) random(5,11); //random velocity from 5-10
    
    switch (randSide) {
      case 0: ce.add(new CircleEnemy(spawnX,0,0,randV)); break; //top
      case 1: ce.add(new CircleEnemy(spawnX,height,0,randV*-1)); break; //bottom
      case 2: ce.add(new CircleEnemy(0,spawnY,randV,0)); break; //left
      case 3: ce.add(new CircleEnemy(width,spawnY,randV*-1,0)); break; //right
    }    
  }
  
  //bouncy enemy spawns. slightly rarer, will stay till the end and max of 3
  int spawnTimeBE = (int) random(0,300);
  
  if (be.size()<3 && spawnTimeBE == 0) {
    int randSide = (int) random(0,4);
    int spawnX = (int) random(0,width+1);
    int spawnY = (int) random(0,height+1);
    int randV1 = (int) random(3,6);
    int randV2 = (int) random(3,6);
    
    switch (randSide) {
      case 0: be.add(new Bouncy(spawnX,0,randV1,randV2)); break;
      case 1: be.add(new Bouncy(spawnX,height,randV1,randV2)); break;
      case 2: be.add(new Bouncy(0,spawnY,randV1,randV2)); break;
      case 3: be.add(new Bouncy(width,spawnY,randV1,randV2)); break;
    }       
  }
  
  /*the stalker has rarer spawn and a max of 1 stalker
    it will remain for the rest of the game
    will not spawn if player is in the top left quadrant */
  int spawnTimeS = (int) random(0,600); 
  if (se.size()==0 && !p.inTopLeft() && spawnTimeS == 0) {
    se.add(new Stalker());
    stalkerPresent = true;
  }
  
  //update position and draw circle enemies
  for (CircleEnemy c : ce) {
    c.update(); c.draw();
    if (c.collide(p)) {gameOver = true;}
    if (c.edge()) {toRemoveCE.add(c);}
  } 
  ce.removeAll(toRemoveCE); //delete any circle enemies that hit the edge
  
  //update and draw boucies
  for (Bouncy b : be) {
    b.update(); b.draw();
    if (b.collide(p)) {gameOver = true;}
  }
  
  //update and draw the stalker if there is one
  if (stalkerPresent) {
    Stalker s = se.get(0);
    s.update(); s.draw();
    if (s.collide(p)) {gameOver = true;}
  }
  
  //game over when player hits projectile
  if (gameOver) {
    fill(255,128); //128 adds opacity
    rectMode(CENTER);
    rect(width/2,height/2,width,100);

    fill(144, 26, 255);
    textAlign(CENTER);
    text("GAME OVER",width/2,height/2);
    noLoop(); //stops draw()
  }
  
}
