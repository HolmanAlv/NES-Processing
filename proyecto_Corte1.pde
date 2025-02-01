import processing.sound.*;
import java.util.ArrayList;

SquareWave square1, square2; // Canales de onda cuadrada
TriangleWave triangle;       // Canal de onda triangular
Noise noise;                 // Canal de ruido
int dutyCycleIndex = 0;       // Ciclo de trabajo actual para las ondas cuadradas
int dutyCycleIndex2 = 0;       // Ciclo de trabajo actual para las ondas cuadradas
float[] dutyCycles = {0.125, 0.25, 0.5, 0.75};  // Opciones de ciclo de trabajo
boolean sharp = false;       // Control para diferenciar entre notas naturales y negras
int currentGenerator = 0;    // Índice del generador actual (0: square1, 1: square2, 2: triangle, 3: noise)
//ArrayList<Mandala> mandalas = new ArrayList<>(); // Lista de mandalas
Notes notes;
int scale = 2;
int xTam = 256*scale;
int yTam = 240*scale;
int sprite = 8*scale;

boolean rectEvent = false;

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
  
  // // Dibujar todos los mandalas
  // for (Mandala mandala : mandalas) {
  //   mandala.display();
  // }
  // //test();
  
  drawRect(frameCount);


  fill(255);
  text("Teclas blancas: q, w, e, r, t, y, u, i, o, p", width / 2, height - 100);
  text("Teclas negras: 2, 3, 5, 6, 7, 9, 0", width / 2, height - 80);
  text("Espacio: Cambiar Duty Cycle | Tab: Cambiar Generador", width / 2, height - 60);
  text("Generador actual: " + getCurrentGeneratorName(), width / 2, height - 40);
  if (currentGenerator == 0)
  text("ancho del ciclo:  " + dutyCycles[dutyCycleIndex], width / 2, height - 20);
  else if (currentGenerator == 1)
  text("ancho del ciclo:  " + dutyCycles[dutyCycleIndex2], width / 2, height - 20);
}

int pos = 0;
void drawRect(int iterator){
  if(rectEvent)
  {
    int looper = iterator % 30;
    strokeWeight(1);
    stroke(255, 0, 0);
    noFill();
    rect(pos, 0, sprite, sprite);
    pos++;
  }

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

// Manejar entradas del teclado para activar las notas
void keyPressed() {
  int noteIndex = -1;

  // Cambiar entre generadores con Tab
  if (key == TAB) {
    currentGenerator = (currentGenerator + 1) % 4; // Ciclar entre 0, 1, 2, 3
    return;
  }

  // Teclas blancas
  if (key >= 'q' || key <= 'p') {
    noteIndex = "qwertyuiop".indexOf(key); // Mapear q-p a índices 0-9
    float freq = 0;
    if (noteIndex != -1) {
      if(currentGenerator == 1){
         freq = notes.naturalNotes2[noteIndex];
      }else if(currentGenerator == 0){
         freq = notes.naturalNotes1[noteIndex];
      }
      if (currentGenerator == 2){
        freq = notes.bassNotes[noteIndex];
      }
      playSound(freq);

      rectEvent = true;

      //mandalas.add(new Mandala(freq, currentGenerator, false));
      //mandalas.add(new Mandala(width / 2, height / 2, freq, currentGenerator, false));
    }
  }
  
  // Teclas negras
  if (key >= '2' && key <= '9' || key == '0') {
    float freq = 0;
    noteIndex = "2356790".indexOf(key); // Mapear 2,3,5,6,7,9,0 a índices 0-6
    if (noteIndex != -1) {
      if(currentGenerator == 1){
         freq = notes.sharpNotes2[noteIndex];
      }else if(currentGenerator == 0){
         freq = notes.sharpNotes1[noteIndex];
      }else if(currentGenerator == 2){
        freq = notes.sharpBassNotes[noteIndex];
      }
      playSound(freq);
      //mandalas.add(new Mandala(freq, currentGenerator, true));

      //mandalas.add(new Mandala(width / 2, height / 2, freq, currentGenerator, true));
    }
  }

  // Cambiar Duty Cycle
  else if (key == ' ' && currentGenerator == 0) {
    dutyCycleIndex = (dutyCycleIndex + 1) % dutyCycles.length;
    square1.setDutyCycle(dutyCycles[dutyCycleIndex]);
  }
  else if (key == ' ' && currentGenerator == 1) {
    dutyCycleIndex2 = (dutyCycleIndex2 + 1) % dutyCycles.length;
    square2.setDutyCycle(dutyCycles[dutyCycleIndex2]);
  }

}

// Manejar la liberación de teclas para detener el sonido
void keyReleased() {
  if ("qwertyuiop2356790".indexOf(key) != -1) {
    stopSound();
  }
}

// Reproducir sonido en el generador actual
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
      noise.play(0.85); // Volumen fijo para el ruido
      break;
  }
}

// Detener sonido en el generador actual
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