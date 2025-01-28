class Noise {
  WhiteNoise osc;

  Noise(PApplet parent) {
    osc = new WhiteNoise(parent);
  }

  void play(float amp) {
    osc.amp(amp);
    osc.play();
  }

  void stop() {
    osc.stop();
  }
}
