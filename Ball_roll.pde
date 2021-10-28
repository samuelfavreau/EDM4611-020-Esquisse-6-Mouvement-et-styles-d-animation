class Ball_roll {
  //Global variables
  PGraphics sourceImage;

  Ani seq1;
  float s1;

  int hue = int(random(360));
  int sat[] = {0, 45, 90};
  int satIndex = int(random(sat.length));
  
  float arcSize = animW/1.5;
  float ballSize = 30;
  float border = 15;
  float offset = arcSize/2 - ballSize/2 - border/2;

  //Constructor
  Ball_roll(float speed, Easing animType) {
    //Creates the PGraphics to draw the animation inside
    sourceImage = createGraphics(animW, animH);
    
    //Initializes the first animation sequence
    seq1 = new Ani(this, speed, "s1", 1, animType);
    seq1.setPlayMode(Ani.YOYO);
    seq1.repeat();
    seq1.start();
  }

  //Displays the animation
  void display() {
    //Draws the animation inside the PGraphics
    sourceImage.beginDraw();
    sourceImage.colorMode(HSB, 360, 100, 100);
    sourceImage.background(hue, sat[(satIndex + 2) % 3], 100);
    sourceImage.noStroke();

    sourceImage.push();
    sourceImage.translate(animW/2, animH/2);
    sourceImage.rotate(radians(90*s1 - 45));
    sourceImage.fill(hue, sat[satIndex % 3], 100);
    sourceImage.circle(0, offset, ballSize);
    sourceImage.pop();
    
    sourceImage.push();
    sourceImage.translate(animW/2, animH/2);
    sourceImage.rotate(radians(45 - 90*s1));
    sourceImage.stroke(hue, sat[(satIndex + 1) % 3], 100);
    sourceImage.strokeWeight(border);
    sourceImage.noFill();
    sourceImage.arc(0, 0, arcSize, arcSize, 0, PI);
    sourceImage.pop();

    sourceImage.endDraw();

    //Displays the PGraphics
    image(sourceImage, 0, 0);
  }
}
