//circle enemy that can kill player
class CircleEnemy extends Entity {
  int vx,vy; //velocity of x and y
  int extent = 40; //width and height of circle
  int radius = extent/2;
  
  CircleEnemy(int x, int y, int vx, int vy) {
    this.x=x; this.y=y;
    this.vx=vx; this.vy=vy;
  }
  
  void draw() {
    noStroke();
    fill(144, 26, 255); //dark purple circle
    circle(x,y,extent);
  }
  
  void update() {
    x+=vx;
    y+=vy;
  }
  
  boolean edge() {
    if (x<0 || x>width) {return true;}
    if (y<0 || y>height) {return true;}
    else {return false;}
  }
  
  boolean collide(Player p) {
    int hitDist = radius + p.radius;
    return dist(x,y,p.x,p.y) <= hitDist;
  }
}
