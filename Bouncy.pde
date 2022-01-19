//tiny circle enemy which damages the player
//bounces of the edges of the screen
class Bouncy extends Entity {
  int vx,vy;
  int extent = 15;
  int radius = extent/2;
  
  Bouncy(int x, int y, int vx, int vy) {
    this.x=x; this.y=y;
    this.vx=vx; this.vy=vy;
  }
  
  void draw() {
    noStroke();
    fill(252,108,133); //pink
    circle(x,y,extent);
  }
  
  void update() {
    if (x<0 || x>width) {vx*=-1;}
    if (y<0 || y>height) {vy*=-1;}
    x+=vx; y+=vy;
  }
  
  boolean collide(Player p) {
    int hitDist = radius + p.radius;
    return dist(x,y,p.x,p.y) <= hitDist;
  }
}
