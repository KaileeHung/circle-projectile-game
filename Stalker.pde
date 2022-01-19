// to make a stalker that follows the player
class Stalker extends Entity {
  int extent = 40;
  int radius = extent/2;
  double easing = 0.05; //speed at which it catches up
  
  void draw() {
    noStroke();
    fill(144, 26, 255);
    circle(x,y,extent);
  }

  void update() {
    // will close the distance between it and the mouse slowly
    x += (mouseX - x) * easing;
    y += (mouseY - y) * easing;
  }
  
  boolean collide(Player p) {
    int hitDist = radius + p.radius;
    return dist(x,y,p.x,p.y) <= hitDist;
  }
}
