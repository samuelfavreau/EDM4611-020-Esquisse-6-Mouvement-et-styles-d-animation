class Animation {
  
  //Global variables
  int animIndex = int(random(animType.length));
  int flipX = int(map(round(random(1)), 0, 1, -1, 1));
  int flipY = int(map(round(random(1)), 0, 1, -1, 1));;
  float speed = random(0.5, 2.1);

  //Objects of the animation styles
  Square_corner sc = new Square_corner(speed, animType[animIndex]);
  Triangle_middle tm = new Triangle_middle(speed, animType[animIndex]);
  Circle_corners cc = new Circle_corners(speed, animType[animIndex]);
  Square_middle sm = new Square_middle(speed, animType[animIndex]);
  Sine_line sl = new Sine_line(speed, animType[animIndex]);
  Ball_roll br = new Ball_roll(speed, animType[animIndex]);

  //Constructor
  Animation() {
  }

  //Displays the animation
  void display(float x, float y, int type) {
    push();
    
    //Repositions the window if the image is fliped
    translate(x + map(flipX, -1, 1, 1, 0)*animW, y + map(flipY, -1, 1, 1, 0)*animH);
    scale(flipX, flipY);
    
    //Displays the correct object depending on the selected style
    if (type == SQUARE_CORNER)
      sc.display();

    else if (type == TRIANGLE_MIDDLE)
      tm.display();

    else if (type == CIRCLE_CORNERS)
      cc.display();

    else if (type == SQUARE_MIDDLE)
      sm.display();

    else if (type == SINE_LINE)
      sl.display();

    else if (type == BALL_ROLL)
      br.display();
    pop();
  }
}
