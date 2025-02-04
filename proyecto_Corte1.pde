import processing.sound.*;
import java.util.ArrayList;

SquareWave square1, square2; 
TriangleWave triangle;     
Noise noise;             
int dutyCycleIndex = 0;      
int dutyCycleIndex2 = 0;     
float[] dutyCycles = {0.125, 0.25, 0.5, 0.75};  
boolean sharp = false;      
int currentGenerator = 0;    
Notes notes;
int scale = 3;
int xTam = 256 * scale;
int yTam = 240 * scale;
ArrayList<Poligono> poligonos = new ArrayList<Poligono>();

void setup() {
  size(256, 240);
  windowResize(xTam, yTam);
  textAlign(CENTER, CENTER);
  frameRate(30);

  notes = new Notes();
  square1 = new SquareWave(this); 
  square2 = new SquareWave(this);
  triangle = new TriangleWave(this);
  noise = new Noise(this);

}

void draw() {
  background(30);
  
  // Dibujar y actualizar todos los polígonos
  for (int i = poligonos.size() - 1; i >= 0; i--) {
    Poligono p = poligonos.get(i);
    p.update();
    p.display();
    if (p.isFinished()) {
      poligonos.remove(i);
    }
  }
  
  fill(255);
  //text("Teclas blancas: q, w, e, r, t, y, u, i, o, p", width / 2, height - 100);
  //text("Teclas negras: 2, 3, 5, 6, 7, 9, 0", width / 2, height - 80);
  //text("Espacio: Cambiar Duty Cycle | Tab: Cambiar Generador", width / 2, height - 60);
  text("Generador actual: " + getCurrentGeneratorName(), 10, height - 40);
  if (currentGenerator == 0)
    text("ancho del ciclo:  " + dutyCycles[dutyCycleIndex], 10, height - 20);
  else if (currentGenerator == 1)
    text("ancho del ciclo:  " + dutyCycles[dutyCycleIndex2], 10, height - 20);
}

// Obtener el nombre del generador actual
String getCurrentGeneratorName() {
  switch (currentGenerator) {
    case 0: return "Square1";
    case 1: return "Square2";
    case 2: return "Triangle";
    case 3: return "Noise";
    default: return "Desconocido";
  }
}

// Manejar entradas del teclado para activar las notas y generar polígonos
void keyPressed() {

  int noteIndex = -1;

  // Cambiar entre generadores con Tab
  if (key == TAB) {
    currentGenerator = (currentGenerator + 1) % 4; 
    return;
  }

  // Teclas blancas
  if (key >= 'q' || key <= 'p') { 
    noteIndex = "qwertyuiop".indexOf(key); 
    float freq = 0;
    if (noteIndex != -1) {
      if (currentGenerator == 1) {
         freq = notes.naturalNotes2[noteIndex];
      } else if (currentGenerator == 0) {
         freq = notes.naturalNotes1[noteIndex];
      }
      if (currentGenerator == 2) {
        freq = notes.bassNotes[noteIndex];
      }
      playSound(freq);

      float radius = random(20, 100);      
      int sides = int(random(3, 10));       
      float x = random(width);               
      float y = random(height);              
      poligonos.add(new Poligono(x, y, radius, sides, currentGenerator));
    }
  }
  
  // Teclas negras
  if ((key >= '2' && key <= '9') || key == '0') {
    float freq = 0;
    noteIndex = "2356790".indexOf(key); 
    if (noteIndex != -1) {
      if (currentGenerator == 1) {
         freq = notes.sharpNotes2[noteIndex];
      } else if (currentGenerator == 0) {
         freq = notes.sharpNotes1[noteIndex];
      } else if (currentGenerator == 2) {
        freq = notes.sharpBassNotes[noteIndex];
      }
      playSound(freq);
      
      float radius = random(20, 100);
      int sides = int(random(3, 10));
      float x = random(width);
      float y = random(height);
      poligonos.add(new Poligono(x, y, radius, sides, currentGenerator));
    }
  }

  else if (key == ' ' && currentGenerator == 0) {
    dutyCycleIndex = (dutyCycleIndex + 1) % dutyCycles.length;
    square1.setDutyCycle(dutyCycles[dutyCycleIndex]);
  }
  else if (key == ' ' && currentGenerator == 1) {
    dutyCycleIndex2 = (dutyCycleIndex2 + 1) % dutyCycles.length;
    square2.setDutyCycle(dutyCycles[dutyCycleIndex2]);
  }
}

void keyReleased() {
  if ("qwertyuiop2356790".indexOf(key) != -1) {
    stopSound();
  }
}

void playSound(float freq) {
  switch (currentGenerator) {
    case 0: 
      square1.start(freq);
      break;
    case 1: 
      square2.start(freq);
      break;
    case 2: 
      triangle.start(freq);
      break;
    case 3: 
      noise.play(0.85); 
      break;
  }
}

void stopSound() {
  switch (currentGenerator) {
    case 0: 
      square1.stop();
      break;
    case 1: 
      square2.stop();
      break;
    case 2: 
      triangle.stop();
      break;
    case 3: 
      noise.stop();
      break;
  }
}