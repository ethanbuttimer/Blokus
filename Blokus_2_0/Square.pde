//Class describing individual squares,
//either the empty squares of a Blokus board,
//the color marked squares used in the first turn,
//or the filled squares making up the game pieces.
//Includes the colors and method used to render the squares.

class Square {
  private int i;
  private int j;
  private int x;
  private int y;
  private int w = 30;
  private boolean colorMarker = false;
  private color mark;
  private int colorID = -1;
  private int pieceTypeID = -1;
  private boolean filled = false;
  
  //red colorID: 0
  //green colorID: 1
  //yellow colorID: 2
  //blue colorID: 3
  
  private color[] currentSet = {color(150), color(0), color(255)};
  
  //colorID gives the index of the list of colors in colorSets.
  private color[][] colorSets = {{color(255, 0, 0), color(200, 60, 60), color(255, 120, 120)},
  {color(0, 200, 0), color(0, 150, 0), color(120, 255, 120)},
  {color(200, 200, 0), color(190, 170, 0), color(255, 255, 0)},
  {color(0, 0, 255), color(0, 0, 200), color(120, 120, 255)}};
  
  Square(int i_, int j_) {
    i = i_;
    j = j_;
    x = i * w;
    y = j * w;
  }
  
  //gives square a certain set of colors to use when rendered as filled. Changes filled attribute.
  void fillIt(int colorID_, int pieceTypeID_) {
    colorID = colorID_;
    pieceTypeID = pieceTypeID_;
    currentSet = colorSets[colorID];
    filled = true;
  }
  
  //sets a color mark used to draw marker circle
  void giveMarker(int colorID_) {
    colorID = colorID_;
    mark = colorSets[colorID][0];
    colorMarker = true;
  }
  
  void changePos(int i_, int j_) {
    i = i_;
    j = j_;
    x = i * w;
    y = j * w;
  }
  
  boolean offBoard() {
    return (i < 0 || j < 0);
  }
  
  //renders individual square unit. If unfilled, also checks to see if initial color marker is needed.
  void show() {
    if (!filled) {
      fill(currentSet[0]);
      stroke(currentSet[1]);
      rect(x + 1, y + 1, w - 2, w - 2);
      stroke(currentSet[2]);
      line(x + 2, y + w - 1, x + w - 1, y + w - 1);
      line(x + w - 1, y + 2, x + w - 1, y + w - 1);
      if (colorMarker) {
        fill(mark);
        stroke(mark);
        ellipse(x + w/2, y + w/2, w - 10, w - 10);
      }
    } else {
      fill(currentSet[0]);
      stroke(currentSet[1]);
      rect(x, y, w, w);
      stroke(currentSet[2]);
      line(x + 1, y + w - 1, x + 2, y + 2);
      line(x + w - 1, y + 1, x + 2, y + 2);
    } 
  }
}
