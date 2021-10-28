class Triangle_middle {
  //Global variables
  PGraphics sourceImage;

  Ani seq1, seq2, seq3;
  float s1, s2, s3;

  int hue = int(random(360));
  int sat[] = {0, 45, 90};
  int satIndex = int(random(sat.length));

  //Constructor
  Triangle_middle(float speed, Easing animType) {
    //Creates the PGraphics to draw the animation inside
    sourceImage = createGraphics(animW, animH);

    //Initializes the first animation sequence
    seq1 = new Ani(this, speed, "s1", 1, animType, "onEnd:startSecond");
    seq1.setPlayMode(Ani.FORWARD);

    //Initializes the second animation sequence
    seq2 = new Ani(this, speed, "s2", 1, animType, "onEnd:startThird");
    seq2.setPlayMode(Ani.FORWARD);

    //Initializes the third animation sequence
    seq3 = new Ani(this, speed, "s3", 1, animType, "onEnd:startFirst");
    seq3.setPlayMode(Ani.FORWARD);

    startFirst();
  }

//Displays the animation
  void display() {
    //Draws the animation inside the PGraphics
    sourceImage.beginDraw();
    sourceImage.colorMode(HSB, 360, 100, 100);
    sourceImage.background(hue, sat[(satIndex + 2) % 3], 100);
    sourceImage.noStroke();

    sourceImage.fill(hue, sat[satIndex % 3], 100);
    sourceImage.triangle(animW/2 - animW*s1, animH, 
      animW/2 + animW*s1, animH, 
      animW/2, animH - animH*s1*2);

    sourceImage.fill(hue, sat[(satIndex + 1) % 3], 100);
    sourceImage.triangle(animW/2 - animW*s2, animH, 
      animW/2 + animW*s2, animH, 
      animW/2, animH - animH*s2*2);

    sourceImage.fill(hue, sat[(satIndex + 2) % 3], 100);
    sourceImage.triangle(animW/2 - animW*s3, animH, 
      animW/2 + animW*s3, animH, 
      animW/2, animH - animH*s3*2);

    sourceImage.endDraw();
    
//Displays the PGraphics
    image(sourceImage, 0, 0);
  }

  //Triggers the first animation
  void startFirst() {
    //Resets the other animations
    seq2.seek(0);
    seq3.seek(0);

    seq1.start();
  }

  //Triggers the second animation
  void startSecond() {
    seq2.start();
  }

  //Triggers the third animation
  void startThird() {
    seq3.start();
  }
}
