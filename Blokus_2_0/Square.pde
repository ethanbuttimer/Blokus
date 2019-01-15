class Square {
  
  int i;
  int j;
  int x;
  int y;
  int w = 30;
  boolean colorMarker = false;
  color mark;
  int colorID = -1;
  int pieceTypeID = -1;
  boolean filled = false;
  
  //red colorID: 0
  //green colorID: 1
  //yellow colorID: 2
  //blue colorID: 3
  
  color[] currentSet = {color(150), color(0), color(255)};
  
  //colorID gives the index of the list of colors in colorSets.
  color[][] colorSets = {{color(255, 0, 0), color(200, 60, 60), color(255, 120, 120)},
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
