//Array List of fruits
class Fruit {
 float x,y;
 int d;
 
 Fruit(){
   x = random(10, width-10);
   y = random(10, height-10);
   d = 10;
 }
 
 void display() {
   fill(255);
   ellipse(x, y, d, d);
 }
 }
