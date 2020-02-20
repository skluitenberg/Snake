class Score{
  int score;
  
  Score(){
    score = 1;
  }
  
  void bonus(int sBonus) {
    score = score + sBonus;
  }
  
  void update() {
    score++;
  }
  
  void display() {
    stroke(255);
    strokeWeight(1);
    textSize(26);
    text(score, 10, 25);
    
  }
}
