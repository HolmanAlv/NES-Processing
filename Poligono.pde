class Poligono {
  float x, y;     
  float radius; 
  int sides;      
  float rotation;
  int alpha;  
  int currentGenerator;  
  
  Poligono(float x, float y, float radius, int sides, int currentGenerator) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.sides = sides;
    this.rotation = random(TWO_PI);
    this.alpha = 255;
    this.currentGenerator = currentGenerator;
  }
  
  void update() {
    alpha -= 2; // Ajusta la velocidad del desvanecimiento si lo deseas
  }
  
  boolean isFinished() {
    return alpha <= 0;
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(rotation);
    noStroke();
    switch (currentGenerator) {
        case 0:
            fill(color(255, 0, 0), alpha);
        break;
        
        case 1:
            fill(color(0, 255, 0), alpha);

        break;

        case 2:
            fill(color(0, 0, 255), alpha);

        break;

        case 3:
            fill(255, alpha);
        break;

        default:
            fill(255, alpha);
        break;
    }
    beginShape();
    for (int i = 0; i < sides; i++) {
      float angle = TWO_PI / sides * i;
      vertex(cos(angle) * radius, sin(angle) * radius);
    }
    endShape(CLOSE);
    popMatrix();
  }
}
