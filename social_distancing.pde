final int SIZE = 10;
Ball characters[] = new Ball[50];

ArrayList<Ball> infected = new ArrayList();
ArrayList<Ball> sane = new ArrayList();

HScrollbar hs1;

void setup() {
  size(1324, 768);
  hs1 = new HScrollbar(width/2, 8, width/2, 16, 16);
  
  int firstInfected = int(random(0, characters.length - 1));
  
  for(int i = 0; i < characters.length; i++) {
    int x = int(random(SIZE, width - SIZE));
    int y = int(random(SIZE, height - SIZE));
    float dirX = random(-1, 1);
    float dirY = random(-1, 1);
    float speed = random(3, 6);
    characters[i] = new Ball(x, y, SIZE, dirX, dirY, speed, i == firstInfected);
    if(i == firstInfected) infected.add(characters[i]);
    else sane.add(characters[i]);
  }
  
  textSize(32);
}

void draw() {
  background(0,0,0);
  
  fill(255);
  text("Sani: " + sane.size(), 30,50);
  text("Malati: " + infected.size(), 30,100);
  
  hs1.update();
  hs1.display();
  
  float stopPercentage = (hs1.getPos() - width / 2) / (width / 2);
  int stopNumber = int(stopPercentage * characters.length);
  
  for(int i = 0; i < characters.length; i++) {
    Ball b = characters[i];
    b.draw();
    if(i > stopNumber) {
      b.update();
    }
  }
  
  //for(Ball b : characters) {
  //  b.draw();
  //  b.update();
  //}
  
  ArrayList<Ball> newInfected = new ArrayList();
  for(Ball inf : infected) {
    for(Ball sa : sane) {
      if(inf.touches(sa)) {
        sa.setInfected(true);
        newInfected.add(sa);
      }
    }
  }
  
  for(Ball n : newInfected) {
    infected.add(n);
    sane.remove(n);
  }
}
