class Snake {
  int x, y, d;
  int Xupdate, Yupdate, speed;
  boolean living = true;
  
  int body = 50;
  ArrayList<PVector> segments = new ArrayList<PVector>();
  
  Snake(){
    x = 500;
    y = 500;
    d = 15;
    Xupdate = 1;
    Yupdate = 0;
    speed = 1;
  }
  
  void dir(int x, int y){
    if (x == Xupdate * -1 && y == Yupdate * -1){
      die();
    } else {
      Xupdate = x;
      Yupdate = y;
    }
  }
  
  void acc(int s) {
    speed = s + speed;
  }

  void update(){
    //if (body == segments.size()){
    //  for(int i = 0; i < segments.size()-1; i++) {
    //    segments.get(i) = segments.get(i+1);
    //  }
    //}
    if (body > 0) {
      if (body == segments.size() && !segments.isEmpty()) {
        segments.remove(0);
      }
      segments.add(new PVector(x,y));
    }
    x = x + (speed * Xupdate);
    y = y + (speed * Yupdate);
  }
  
  void die () {
    living = false;
  }
  
  void display() {
    fill(255);
    noStroke();
    for (int i = 0; i < segments.size(); i ++) {
      rect(segments.get(i).x, segments.get(i).y, d, d);
    }
    rect(x, y, d, d, 2); // head
    //rect(x, y, 15, body, 20); //test body
  }
}
