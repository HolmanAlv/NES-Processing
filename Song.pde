import processing.sound.*;

public class Song {
  SquareWave square1, square2;
  TriangleWave triangle;
  Noise noise;
  PApplet parent;

  public Song(PApplet parent) {
    this.parent = parent;
    square1 = new SquareWave(parent);
    square2 = new SquareWave(parent);
    triangle = new TriangleWave(parent);
    noise = new Noise(parent);
  }

  public void play() {
    //Canal 1 (melodía principal)
    new Thread(() -> {
     playMelody(square1, new float[] {261.63, 293.66, 329.63, 261.63}, 500); // Do, Re, Mi, Do
    }).start();

    // Canal 2 (armonía)
    //new Thread(() -> {
   //   playMelody(square2, new float[] {196.00, 220.00, 246.94, 196.00}, 500); // Sol, La, Si, Sol
    //}).start();

    // Canal 3 (bajo)
    //new Thread(() -> {
    //  playMelody(triangle, new float[] {130.81, 146.83, 164.81, 130.81}, 1000); // Do bajo, Re bajo, Mi bajo, Do bajo
    //}).start();

    // Canal 4 (percusión)
    // new Thread(() -> {
    //   playPercussion(noise, 500);
    // }).start();
  }

  private void playMelody(Object channel, float[] notes, int duration) {
    int totalNotes = 30_000 / (notes.length * duration); // Repetir para que dure 30 segundos
    for (int i = 0; i < totalNotes; i++) {
      for (float freq : notes) {
        if (channel instanceof Pulse) {
          ((Pulse) channel).play();
          ((Pulse) channel).freq(freq);
        } else if (channel instanceof TriOsc) {
          ((TriOsc) channel).play();
          ((TriOsc) channel).freq(freq);
        }
        parent.delay(duration);
      }
    }
    //channel.stop();
  }

  private void playPercussion(Noise noiseChannel, int duration) {
    int totalHits = 30_000 / (duration * 2); // Duración de 30 segundos
    for (int i = 0; i < totalHits; i++) {
      noiseChannel.play(0.5); // Reproduce ruido con un volumen moderado
      parent.delay(duration);
      noiseChannel.stop();
      parent.delay(duration); // Espacio entre golpes
    }
  }
}
