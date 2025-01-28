class SquareWave {
  Pulse osc;
  
  SquareWave(PApplet parent) {
    osc = new Pulse(parent);
  }
  
  void start(float freq) {
    osc.play();
    osc.freq(freq);
  }
  
  void freq(float freq) {
    osc.freq(freq);
  }
  
  void setDutyCycle(float duty) {
    osc.width(duty); // Cambiar ciclo de trabajo
  }
  
  void stop() {
    osc.stop();
  }
}
