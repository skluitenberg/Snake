class Obstacle {
 float x,y,d,e;
 
 Obstacle(){
   x = random(0, width);
   y = random(0, height);
   d = random(5, 100);
   e = random(5, 100);
 }
 
 void display() {
   fill(255);
   rect(x, y, d, e);
 }
 }
