class Circle_corners {
  //Global variables
  PGraphics sourceImage;

  Ani seq1, seq2, seq3, seq4;
  float s1, s2, s3, s4;

  int hue = int(random(360));
  int sat[] = {0, 30, 60, 90};
  int satIndex = int(random(sat.length));

  float offX = animW/4;
  float offY = animH/4;

  //Constructor
  Circle_corners(float speed, Easing animType) {

    //Creates the PGraphics to draw the animation inside
    sourceImage = createGraphics(animW, animH);

    //Initializes the first animation sequence
    seq1 = new Ani(this, speed, "s1", 1, animType, "onEnd:startSecond");
    seq1.setPlayMode(Ani.FORWARD);

    //Initializes the second animation sequence
    seq2 = new Ani(this, speed, "s2", 1, animType, "onEnd:startThird");
    seq2.setPlayMode(Ani.FORWARD);

    //Initializes the third animation sequence
    seq3 = new Ani(this, speed, "s3", 1, animType, "onEnd:startFourth");
    seq3.setPlayMode(Ani.FORWARD);

    //Initializes the fourth animation sequence
    seq4 = new Ani(this, speed, "s4", 1, animType, "onEnd:startFirst");
    seq4.setPlayMode(Ani.FORWARD);

    startFirst();
  }

  //Displays the animation
  void display() {
    //Draws the animation inside the PGraphics
    sourceImage.beginDraw();
    sourceImage.colorMode(HSB, 360, 100, 100);
    sourceImage.background(hue, sat[(satIndex + 3) % 4], 100);
    sourceImage.noStroke();

    sourceImage.fill(hue, sat[satIndex % 4], 100);
    sourceImage.circle(offX, offY, max(animW, animH)*s1*2.5);

    sourceImage.fill(hue, sat[(satIndex + 1) % 4], 100);
    sourceImage.circle(animW - offX, animH - offY, max(animW, animH)*s2*2.5);

    sourceImage.fill(hue, sat[(satIndex + 2) % 4], 100);
    sourceImage.circle(animW - offX, offY, max(animW, animH)*s3*2.5);

    sourceImage.fill(hue, sat[(satIndex + 3) % 4], 100);
    sourceImage.circle(offX, animH - offY, max(animW, animH)*s4*2.5);

    sourceImage.endDraw();

    //Displays the PGraphics
    image(sourceImage, 0, 0);
  }

  //Triggers the first animation
  void startFirst() {
    //Resets the other animations
    seq2.seek(0);
    seq3.seek(0);
    seq4.seek(0);

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

  //Triggers the fourth animation
  void startFourth() {
    seq4.start();
  }
}
