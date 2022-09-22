class analogClock{
  private int x, y, radius;
  private float secondsRadius, minutesRadius, hoursRadius, clockDiameter;

analogClock(int tempX, int tempY, int tempRadius){
  radius=tempRadius;
  x=tempX;
  y=tempY;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
};
void draw(){

  
  // Draw the clock background
  fill(25,0,175);
  noStroke();
  ellipse(x, y, clockDiameter, clockDiameter);
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  stroke(255);
  strokeWeight(1);
  line(x, y, x + cos(s) * secondsRadius, y + sin(s) * secondsRadius);
  strokeWeight(2);
  line(x, y, x + cos(m) * minutesRadius, y + sin(m) * minutesRadius);
  strokeWeight(4);
  line(x, y, x + cos(h) * hoursRadius, y + sin(h) * hoursRadius);
  
  // Draw the minute ticks
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float vx = x + cos(angle) * secondsRadius;
    float vy = y + sin(angle) * secondsRadius;
    vertex(vx, vy);
  }
  endShape();

};
}
