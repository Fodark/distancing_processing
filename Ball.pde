class Ball {
  private int x, y, radius;
  private float dirX, dirY, speed;
  private boolean infected;
  
  Ball(int x, int y, int radius, float dirX, float dirY, float speed, boolean infected) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.dirX = dirX;
    this.dirY = dirY;
    this.speed = speed;
    this.infected = infected;
  }
  
  int getX() {
    return this.x;
  }
  
  int getY() {
    return this.y;
  }
  
  void setInfected(boolean infected) {
    this.infected = infected;
  }
  
  boolean touches(Ball other) {
    return sqrt( pow((this.x - other.getX()), 2) + pow((this.y - other.getY()), 2)) < 2 * this.radius;
  }
  
  void draw() {
    fill(this.infected ? 0 : 255, 255, this.infected ? 0 : 255);
    ellipseMode(RADIUS);
    ellipse(x, y, radius, radius);
  }
  
  void update() {
    this.x += this.speed * this.dirX;
    this.y += this.speed * this.dirY;
    
    if(this.x < this.radius || this.x > (width - this.radius)) {
      this.dirX *= -2;
      return;
    }
    
    if(this.y < this.radius || this.y > (height - this.radius)) {
      this.dirY *= -2;
      return;
    }
    
    float eps = random(0, 1);
    if(eps < .05) {
      this.dirX = random(-1, 1);
      this.dirY = random(-1, 1);
    }
  }
}
