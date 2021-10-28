class Sine_line {
  //Global variables
  PGraphics sourceImage;

  Ani seq1;
  float s1;

  int hue = int(random(360));
  int sat[] = {0, 45, 90};
  int satIndex = int(random(sat.length));

  //Constructor
  Sine_line(float speed, Easing animType) {
    //Creates the PGraphics to draw the animation inside
    sourceImage = createGraphics(animW, animH);

    //Initializes the first animation sequence
    seq1 = new Ani(this, speed, "s1", 1, animType, "onEnd:startFirst");
    seq1.setPlayMode(Ani.FORWARD);

    startFirst();
  }

  //Displays the animation
  void display() {

    //Draws the animation inside the PGraphics
    sourceImage.beginDraw();
    sourceImage.colorMode(HSB, 360, 100, 100);
    sourceImage.background(hue, sat[(satIndex + 1) % 3], 100);
    sourceImage.noFill();
    sourceImage.strokeWeight(8);

    sourceImage.stroke(hue, sat[satIndex % 3], 100);
    for (int j = 0; j <= animH; j += animW/4) {
      int index = 0;
      for (int i = -4 * animW/10; i <= animW + animW/5; i+=animW/5) {
        index++;
        if (index % 2 == 0)
          sourceImage.arc(i + 4 * animW/10*s1, j, animW/5, animW/5, 0, PI);

        else
          sourceImage.arc(i + 4 * animW/10*s1, j, animW/5, animW/5, PI, TWO_PI);
      }
    }

    sourceImage.endDraw();
    
    //Displays the PGraphics
    image(sourceImage, 0, 0);
  }
  
  //Triggers the first animation
  void startFirst() {
    seq1.start();
  }
}
