class Notes{
    
    float[] naturalNotes = {
        261.63, // Do (1)
        293.66, // Re (2)
        329.63, // Mi (3)
        349.23, // Fa (4)
        392.00, // Sol (5)
        440.00, // La (6)
        493.88, // Si (7)
        523.25, // Do superior (8)
        587.33, // Re bajo (9)
        659.26// Mi #
    };
    
    float[] sharpNotes = {
        277.18, // Do (1)
        311.13, // Re (2)
        369.99, // Fa (4)
        415.30, // Sol (5)
        466.16, // La (6)
        554.37, // Do#
        622.25, // Re#
    };
    
   // FloatDict notes = new FloatDict(("C", 32.7));
    
    //notes.set("C", 32.7);
    // notes.set("C#", 34.65);
    // notes.set("D", 36.71);
    // notes.set("D#", 38.89);
    // notes.set("E", 41.20);
    // notes.set("F", 43.65);
    // notes.set("F#", 46.25);
    // notes.set("G", 49.00);
    // notes.set("G#", 51.91);
    // notes.set("A", 55.00);
    // notes.set("A#", 58.27);
    // notes.set("B", 61.74);
    
    // notes.set("C_", 65.41);
    // notes.set("C#_", 69.30);
    // notes.set("D_", 73.42);
    // notes.set("D#_", 77.78);
    // notes.set("E_", 82.41);
    // notes.set("F_", 87.31);
    // notes.set("F#_", 92.50);
    // notes.set("G_", 98.00);
    // notes.set("G#_", 103.83);
    // notes.set("A_", 110.00);
    // notes.set("A#_", 116.54);
    // notes.set("B_", 123.47);
    
    // notes.set("C__", 130.81);
    // notes.set("C#__", 138.59);
    // notes.set("D__", 146.83);
    // notes.set("D#__", 155.56);
    // notes.set("E__", 164.81);
    // notes.set("F__", 174.61);
    // notes.set("F#__", 185.00);
    // notes.set("G__", 196.00);
    // notes.set("G#__", 207.65);
    // notes.set("A__", 220.00);
    // notes.set("A#__", 233.08);
    // notes.set("B__", 246.94);
    
    // notes.set("C___", 261.63);
    // notes.set("C#___", 277.18);
    // notes.set("D___", 293.66);
    // notes.set("D#___", 311.13);
    // notes.set("E___", 329.63);
    // notes.set("F___", 349.23);
    // notes.set("F#___", 369.99);
    // notes.set("G___", 392.00);
    // notes.set("G#___", 415.30);
    // notes.set("A___", 440.00);
    // notes.set("A#___", 466.16);
    // notes.set("B___", 493.88);
    
    // notes.set("C____", 523.25);
    // notes.set("C#____", 554.37);
    // notes.set("D____", 587.33);
    // notes.set("D#____", 622.25);
    // notes.set("E____", 659.25);
    // notes.set("F____", 698.46);
    // notes.set("F#____", 739.99);
    // notes.set("G____", 783.99);
    // notes.set("G#____", 830.61);
    // notes.set("A____", 880.00);
    // notes.set("A#____", 932.33);
    // notes.set("B____", 987.77);
    
    // notes.set("C_____", 1046.50);
    // notes.set("C#_____", 1108.73);
    // notes.set("D_____", 1174.66);
    // notes.set("D#_____", 1244.51);
    // notes.set("E_____", 1318.51);
    // notes.set("F_____", 1396.91);
    // notes.set("F#_____", 1479.98);
    // notes.set("G_____", 1567.98);
    // notes.set("G#_____", 1661.22);
    // notes.set("A_____", 1760.00);
    // notes.set("A#_____", 1864.66);
    // notes.set("B_____", 1975.53);
    
    // notes.set("C______", 2093.00);
    // notes.set("C#______", 2217.46);
    // notes.set("D______", 2349.32);
    // notes.set("D#______", 2489.02);
    // notes.set("E______", 2637.02);
    // notes.set("F______", 2793.83);
    // notes.set("F#______", 2959.96);
    // notes.set("G______", 3135.96);
    // notes.set("G#______", 3322.44);
    // notes.set("A______", 3520.00);
    // notes.set("A#______", 3729.31);
    // notes.set("B______", 3951.07);
    
    // notes.set("C_______", 4186.01);
    // notes.set("C#_______", 4434.92);
    // notes.set("D_______", 4698.64);
    // notes.set("D#_______", 4978.03);
    // notes.set("E_______", 5274.04);
    // notes.set("F_______", 5587.65);
    // notes.set("F#_______", 5919.91);
    // notes.set("G_______", 6271.93);
    // notes.set("G#_______", 6644.88);
    // notes.set("A_______", 7040.00);
    // notes.set("A#_______", 7458.62);
    // notes.set("B_______", 7902.13);
}