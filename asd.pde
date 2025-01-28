// import processing.sound.*;

// SquareWave square1, square2;
// WaveGenerator triangle;
// Noise noise;

// int numRadios = 12;  // Número de radios del mandala
// float rotationSpeed = 0.01;
// float baseRadius = 100;
// float noiseEffect = 0;

// void setup() {
//   size(800, 800);
//   square1 = new SquareWave(this);
//   square2 = new SquareWave(this);
//   triangle = new WaveGenerator(this);
//   noise = new Noise(this);

//   square1.start(440);
//   square2.start(330);
//   triangle.start(220);
//   noise.play(0.5);
// }

// void draw() {
//   background(30);
//   translate(width / 2, height / 2);

//   // Aplicar rotación general al mandala
//   float angleStep = TWO_PI / numRadios;
//   rotate(frameCount * rotationSpeed);

//   // Dibujar mandala
//   for (int i = 0; i < numRadios; i++) {
//     pushMatrix();
//     rotate(angleStep * i);
//     drawLayer(i);
//     popMatrix();
//   }
// }

// // Dibujar una capa del mandala
// void drawLayer(int layerIndex) {
//   float freq1 = square1.getFreq();
//   float freq2 = square2.getFreq();
//   float amp = triangle.getAmplitude() * 100;
//   noiseEffect = random(-5, 5);

//   noFill();
//   stroke(lerpColor(color(255, 0, 150), color(0, 150, 255), layerIndex / float(numRadios)));
//   strokeWeight(2);

//   // Círculos pulsantes
//   ellipse(baseRadius + amp + noiseEffect, 0, freq1 * 0.2, freq2 * 0.2);

//   // Triángulos y líneas geométricas
//   beginShape();
//   for (float a = 0; a < TWO_PI; a += PI / 4) {
//     float x = cos(a) * (baseRadius + amp + layerIndex * 10);
//     float y = sin(a) * (baseRadius + amp + layerIndex * 10);
//     vertex(x, y);
//   }
//   endShape(CLOSE);
// }

// // Clase para onda cuadrada
// class SquareWave {
//   SoundOscillator osc;

//   SquareWave(PApplet parent) {
//     osc = new SoundOscillator(parent, "square");
//   }

//   void start(float freq) {
//     osc.play();
//     osc.freq(freq);
//   }

//   float getFreq() {
//     return osc.getFreq();
//   }
// }

// // Clase para onda triangular
// class WaveGenerator {
//   SoundOscillator osc;

//   WaveGenerator(PApplet parent) {
//     osc = new SoundOscillator(parent, "triangle");
//   }

//   void start(float freq) {
//     osc.play();
//     osc.freq(freq);
//   }

//   float getAmplitude() {
//     return osc.getAmp();
//   }
// }
