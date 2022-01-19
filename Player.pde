//a mouse controlled player
class Player extends Entity {
  int extent = 20; //width and height of circle
  int radius = extent/2;
 
  void draw() {
    noStroke();
    fill(0,0,255); //blue circle
    circle(x,y,extent);
  }
  
  void update() {
    x = mouseX;
    y = mouseY;
  }
  
  /*returns true if the player is in the
    top left quadrant. If true, then later,
    the stalker won't spawn otherwise you'll
    die immediately
  */
  boolean inTopLeft() {
    return x<(width/2) && y<(height/2);
  }

}
