Snake s;
Score score;

ArrayList<Fruit> fruits = new ArrayList<Fruit>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

void setup() { 
  size(1500,800);
  s = new Snake();
  score = new Score();
  fruits.add(new Fruit());
}

void draw() {
 background(0);
 score.update();
 score.display();
 for (int i = 0; i < fruits.size(); i++) {
   Fruit part = fruits.get(i);
   part.display();
 }
 collision();
 
 if (s.living) {
   s.update();
   s.display();
 } else {
   gameover();
 }
 for (int a = 0; a < obstacles.size(); a++) {
   Obstacle part = obstacles.get(a);
   part.display();
 }
 
 
 
}


void keyPressed() {               //snake directions
  if (key == CODED) {
    if (keyCode == LEFT) {
      s.dir(-1, 0);
    } else if (keyCode == RIGHT) {
      s.dir(1, 0);
    }
    if (keyCode == UP) {
      s.dir(0, -1);
    } else if (keyCode == DOWN) {
      s.dir(0, 1);
    }
  }
}

void collision () {
  
   /* location of snake, boundary, fruit, remainder of the body, obstacles 
   snake - x, y locations, and size
   fruit - x, y locations, determine distance with dist and d/2 between snake and fruit, growth when fruit is eaten
   boundary - x = 0; x= height; y=0; y=width
   obstacles = x, y locations, and size
   body = x, y locations, size, end body follow head
   
   */
   //boundary test
  if (s.x <= 0 || s.x >= width || s.y <= 0 || s.y >= height) {
    println("boom");
    gameover();
  }
  
  //fruit test
  /*use dist function to determine distance between snake and fruit to see if they are touching, 
  also if we can access size of snake and fruit*/
  for (int i = 0; i <fruits.size(); i++) {
    Fruit f = fruits.get(i);
    int snake2fruit = int(dist(s.x, s.y, f.x, f.y));
    
    if (snake2fruit <= (f.d/2 + s.d/2)) {
      println("collide");
      fruits.remove(i);
      growsnake();
      makefruit();
      s.body++;
    }
  }
  
  //remainder of body test
  
  
  
  //obstacles test
   for (int a = 0; a < obstacles.size(); a++) {
     Obstacle o = obstacles.get(a);
     int snake2obstacles = int(dist(s.x, s.y, o.x, o.y));
     
     if (snake2obstacles <= (s.d/2 + o.d/2)) {
       println("oops");
       gameover();
     }
   }
}

void makefruit() {
  fruits.add(new Fruit());
  //obstacles.add(new Obstacle());
  score.score++;
  score.bonus(500);
}


void gameover() {
  background(255, 0 , 0);
  text("game over", width/2, height/2);
  noLoop();
}

void growsnake() {       //snake grows with each treat that is eaten
  //s.body(10);
  s.acc(1);
}


//next step make snake grow, speed up after time, score
