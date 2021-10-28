/*
 * Class: EDM4611-020
 * Title: Esquisse 6 - Mouvement et styles d’animation
 * Autor: Samuel Favreau
 
 * Instructions: -Keep the ENTER key pressed to save an image sequence.
 */

//Librairies
import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

//Global variables
ArrayList<Animation> animations = new ArrayList<Animation>();
IntList animStyle = new IntList();;

int animW;
int animH;

int nb = int(random(2, 11));
int col = nb;
int row = nb;

boolean recordKey = false;
int frameNb = 0;

final int SQUARE_CORNER = 0;
final int TRIANGLE_MIDDLE = 1;
final int CIRCLE_CORNERS = 2;
final int SQUARE_MIDDLE = 3;
final int SINE_LINE = 4;
final int BALL_ROLL = 5;

//Easing types
Easing[] animType = {
  Ani.LINEAR, 
  Ani.QUAD_IN, 
  Ani.QUAD_OUT, 
  Ani.QUAD_IN_OUT, 
  Ani.CUBIC_IN, 
  Ani.CUBIC_OUT, 
  Ani.CUBIC_IN_OUT, 
  Ani.QUART_IN, 
  Ani.QUART_OUT, 
  Ani.QUART_IN_OUT, 
  Ani.QUINT_IN, 
  Ani.QUINT_OUT, 
  Ani.QUINT_IN_OUT, 
  Ani.SINE_IN, 
  Ani.SINE_OUT, 
  Ani.SINE_IN_OUT, 
  Ani.CIRC_IN, 
  Ani.CIRC_OUT, 
  Ani.CIRC_IN_OUT, 
  Ani.EXPO_IN, 
  Ani.EXPO_OUT, 
  Ani.EXPO_IN_OUT, 
  Ani.BACK_IN, 
  Ani.BACK_OUT, 
  Ani.BACK_IN_OUT, 
  Ani.BOUNCE_IN, 
  Ani.BOUNCE_OUT, 
  Ani.BOUNCE_IN_OUT, 
  Ani.ELASTIC_IN, 
  Ani.ELASTIC_OUT, 
  Ani.ELASTIC_IN_OUT
};

//----------------------------------------------------------------------------------
//                                    SETUP
//----------------------------------------------------------------------------------

void setup() {
  //Size of the canvas
  size(800, 800);

  //Initializes the Ani librairie
  Ani.init(this);
  Ani.noAutostart();

  //Sets the size of the windows
  animW = int(width/col);
  animH = int(height/row);

  //Adds a new animation and selects a new style for every window
  for (int i = 0; i < col*row; i++) {
    animations.add(new Animation());
    animStyle.append(int(random(6)));
  }
}

//----------------------------------------------------------------------------------
//                                    DRAW
//----------------------------------------------------------------------------------

void draw() {
  //Refreshes every frame
  background(255);

  //Displays every window
  for (int j = 0; j < row; j++) {
    for (int i = 0; i < col; i++) {
      int index = (j*col) + i;
      animations.get(index).display(i * animW, j * animH, animStyle.get(index));
    }
  }
  
  //Saves the frame if the record key is pressed
  if(recordKey){
    saveFrame("data/frames/frames-" + nf(frameNb, 4) + ".png");
    frameNb++;
  }
}

//----------------------------------------------------------------------------------
//                                    FUNCTIONS
//----------------------------------------------------------------------------------

//Checks if the record key is pressed
void keyPressed(){
  if(keyCode == ENTER){
    recordKey = true;
  }
}

//Checks if the record key is released
void keyReleased(){
  if(keyCode == ENTER){
    recordKey = false;
  }
}
