// Clase para representar los mandalas
class Mandala {
  float x, y, freq;
  int type; // Tipo de generador
  boolean isSharp;
  
  int scale = 3;
  int sprite = 8 * scale;
  
  Mandala(float x, float y, float freq, int type, boolean isSharp) {
      this.x = x;
      this.y = y;
      this.freq = freq;
      this.type = type;
      this.isSharp = isSharp;
  }
  Mandala(float freq, int type, boolean isSharp) {
    this.freq = freq;
    this.type = type;
    this.isSharp = isSharp;
  }
  
  
  int framesPorCapa = 15;
  void test() {
    int capa = frameCount / framesPorCapa;
    translate(width / 2, height / 2);
    fill(255,0,0);
    rectMode(CENTER);
    for (int i = -capa; i <= capa; i++) {
      for (int j = -capa; j <= capa; j++) {
          rect(0 + i*sprite - sprite/2, 0 + j*sprite - sprite/2,sprite, sprite);
          
      }
    }    
  }
  
  void display() {
    noFill();
    strokeWeight(2);
    
    // Colores basados en el tipo de sonido
    if (type == 0) stroke(255, 0, 0, 150); // Square1: rojo
    if (type == 1) stroke(0, 255, 0, 150); // Square2: verde
    if (type == 2) stroke(0, 0, 255, 150); // Triangle: azul
    if (type == 3) stroke(255, 255, 0, 150); // Noise: amarillo
      
    float radius = map(freq, 200, 800, 50, 200);
    int points = isSharp ? 12 : 8;
      
    for (int i = 0; i < points; i++) {
      float angle1 = TWO_PI / points * i;
      float angle2 = TWO_PI / points * (i + 1);
      float x1 = x + cos(angle1) * radius;
      float y1 = y + sin(angle1) * radius;
      float x2 = x + cos(angle2) * radius;
      float y2 = y + sin(angle2) * radius;
      
      if (type == 0) { // Square1: círculos concéntricos
        ellipse(x, y, radius, radius);
      } else if (type == 1) { // Square2: líneas radiales
          line(x, y, x1, y1);
      } else if (type == 2) { // Triangle: polígono cerrado
          beginShape();
          vertex(x, y);
          vertex(x1, y1);
          vertex(x2, y2);
          endShape(CLOSE);
      } else if (type == 3) { // Noise: puntos aleatorios
          for (int j = 0; j < 50; j++) {
            float px =x + random( - radius, radius);
            float py =y + random( - radius, radius);
            point(px, py);
          }
      }
    }
  }
}
