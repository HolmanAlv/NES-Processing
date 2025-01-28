class TriangleWave {
  TriOsc osc;
  
  TriangleWave(PApplet parent) {
    osc = new TriOsc(parent);
  }
  
  void start(float freq) {
    osc.play();
    osc.freq(freq);
  }
  
  void freq(float freq) {
    osc.freq(freq);
  }
  
  void stop() {
    osc.stop();
  }
}
