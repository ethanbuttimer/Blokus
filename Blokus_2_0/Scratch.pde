/*
icon = loadImage("blokusTitle.jpg");
text("Player 1: Please pick your color.");
text("Player 2: Please pick your color.");
text("Neither player has selected a color.");
text("Player 1 has not selected a color.");
text("Player 2 has not selected a color.");
text("Each player must select a unique color.");

  Square[] type1 = {new Square(0, 0, true)};
  Square[] type2 = {new Square(0, 0, true), new Square(0, 1, true)};
  Square[] type3 = {new Square(0, 0, true), new Square(0, -1, true), new Square(0, 1, true)};
  Square[] type4 = {new Square(0, 0, true), new Square(0, 1, true), new Square(1, 0, true)};
  Square[] type5 = {new Square(0, 0, true), new Square(0, 1, true), new Square(0, -1, true), new Square(0, -2, true)};
  Square[] type6 = {new Square(0, 0, true), new Square(-1, 0, true), new Square(0, 1, true), new Square(0, 2, true)};
  Square[] type7 = {new Square(0, 0, true), new Square(1, 0, true), new Square(0, 1, true), new Square(0, -1, true)};
  Square[] type8 = {new Square(0, 0, true), new Square(1, 0, true), new Square(0, 1, true), new Square(1, 1, true)};
  Square[] type9 = {new Square(0, 0, true), new Square(1, 0, true), new Square(0, 1, true), new Square(-1, 1, true)};
  Square[] type10 = {new Square(0, 0, true), new Square(0, 1, true), new Square(0, 2, true), new Square(0, -1, true), new Square(0, -2, true)};
  Square[] type11 = {new Square(0, 0, true), new Square(0, 1, true), new Square(0, 2, true), new Square(0, -1, true), new Square(-1, -1, true)};
  Square[] type12 = {new Square(0, 0, true), new Square(0, 1, true), new Square(0, 2, true), new Square(-1, 0, true), new Square(-1, -1, true)};
  Square[] type13 = {new Square(0, 0, true), new Square(0, 1, true), new Square(0, -1, true), new Square(-1, 0, true), new Square(-1, -1, true)};
  Square[] type14 = {new Square(0, 0, true), new Square(0, 1, true), new Square(-1, 1, true), new Square(-1, -1, true), new Square(0, -1, true)};
  Square[] type15 = {new Square(0, 0, true), new Square(1, 0, true), new Square(0, 1, true), new Square(0, -1, true), new Square(0, -2, true)};
  Square[] type16 = {new Square(0, 0, true), new Square(1, 0, true), new Square(0, 1, true), new Square(-1, 0, true), new Square(0, 2, true)};
  Square[] type17 = {new Square(0, 0, true), new Square(1, 0, true), new Square(0, 1, true), new Square(2, 0, true), new Square(0, 2, true)};
  Square[] type18 = {new Square(0, 0, true), new Square(1, 0, true), new Square(0, 1, true), new Square(-1, 1, true), new Square(1, -1, true)};
  Square[] type19 = {new Square(0, 0, true), new Square(1, 0, true), new Square(-1, 0, true), new Square(-1, 1, true), new Square(1, -1, true)};
  Square[] type20 = {new Square(0, 0, true), new Square(1, 0, true), new Square(0, 1, true), new Square(-1, 0, true), new Square(-1, -1, true)};
  Square[] type21 = {new Square(0, 0, true), new Square(1, 0, true), new Square(0, 1, true), new Square(-1, 0, true), new Square(0, -1, true)};
  
  Piece(int playerID_, int typeID_) {
    playerID = playerID_;
    typeID = typeID_;
    
    switch  (playerID) {
      case 1: colorSet = redSet;
              break;
      case 2: colorSet = blueSet;
              break;
      case 3: colorSet = greenSet;
              break;
      default: colorSet = yellowSet;
              break;        
    }
    
    switch  (typeID) {
      case 1: squareSet = type1;
              break;
      case 2: squareSet = type2;
              break;
      case 3: squareSet = type3;
              break;
      case 4: squareSet = type4;
              break;    
      case 5: squareSet = type5;
              break;  
      case 6: squareSet = type6;
              break;  
    }
  }
  
  buttonList.remove(startButton);
  buttonList.remove(redButton1);
  buttonList.remove(greenButton1);
  buttonList.remove(yellowButton1);
  buttonList.remove(blueButton1);
  buttonList.remove(redButton2);
  buttonList.remove(greenButton2);
  buttonList.remove(yellowButton2);
  buttonList.remove(blueButton2);
  
  void show() {
    if (filled) {
      fill(colorSet[0]);
      stroke(colorSet[1]);
      rect(x, y, w, w);
      stroke(colorSet[2]);
      line(x + 1, y + w - 1, x + 2, y + 2);
      line(x + w - 1, y + 1, x + 2, y + 2);
    } else {
      fill(colorSet[0]);
      stroke(colorSet[1]);
      rect(x + 1, y + 1, w - 2, w - 2);
      stroke(colorSet[2]);
      line(x + 1, y + w, x + w - 1, y + w - 1);
      line(x + w, y + 1, x + w - 1, y + w - 1);
    }
  }
  
  void keyPressed() {
   if (key == CODED) {
   if (keyCode == UP) {
         
   }
   }
}

class Square {
  
  int i;
  int j;
  int x;
  int y;
  int w = 30;
  boolean filled;
  boolean colorMarker = false;
  color mark;
  int colorID = -1;
  
  int typeID = -1;
  
  //red colorID: 0
  //blue colorID: 1
  //green colorID: 2
  //yellow colorID: 3
  
  color[] currentSet = {color(150), color(0), color(255)};
  
  //colorID gives the index of the list of colors in colorSets.
  color[][] colorSets = {{color(255, 0, 0), color(200, 60, 60), color(255, 120, 120)},
  {color(0, 0, 255), color(0, 0, 200), color(120, 120, 255)},
  {color(0, 200, 0), color(0, 150, 0), color(120, 255, 120)},
  {color(200, 200, 0), color(190, 170, 0), color(255, 255, 0)}};
  
  Square(int i_, int j_, boolean filled_) {
    i = i_;
    j = j_;
    x = i * w;
    y = j * w;
    filled = filled_;
  }
  
  //gives square a certain set of colors to use when rendered as filled. Changes filled attribute.
  void fillIt(int colorID_) {
    colorID = colorID_;
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

for (Button but : buttonList) {
      if (but.under(mouseX, mouseY)) {
        but.go();
      }
    }
    
  int numericRepresentation() {
    if (colorMarker) {
      return -2;
    } else if (!filled) {
      return -1;
    } else {
      return colorID;
    }
  }
  
    Board clone() {    
    Board cloned = toObject(toIntegerArray());
    return cloned;
  }
  
  int[][] toIntegerArray() {
    int[][] arrayRep = new int[cols][rows];
    for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      arrayRep[i][j] = positions[i][j].numericRepresentation();
    }
    }
    return arrayRep;
  }
  
  Board toObject(int[][] coded) {
    Board objectRep = new Board(cols, rows, insetsX, insetsY, scaler);
    for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      Square sqr = new Square(i, j);
      int code = coded[i][j];
      objectRep.positions[i][j] = sqr;
    }
    }
    return objectRep;
  }
  
  //storage of all 21 shape types as a set of squares
  Square[][] pieceTypes = {{new Square(0, 0)},
  {new Square(0, 0), new Square(0, 1)},
  {new Square(0, 0), new Square(0, -1), new Square(0, 1)},
  {new Square(0, 0), new Square(0, 1), new Square(1, 0)},
  {new Square(0, 0), new Square(0, 1), new Square(0, -1), new Square(0, -2)},
  {new Square(0, 0), new Square(-1, 0), new Square(0, 1), new Square(0, 2)},
  {new Square(0, 0), new Square(1, 0), new Square(0, 1), new Square(0, -1)},
  {new Square(0, 0), new Square(1, 0), new Square(0, 1), new Square(1, 1)},
  {new Square(0, 0), new Square(1, 0), new Square(0, 1), new Square(-1, 1)},
  {new Square(0, 0), new Square(0, 1), new Square(0, 2), new Square(0, -1), new Square(0, -2)},
  {new Square(0, 0), new Square(0, 1), new Square(0, 2), new Square(0, -1), new Square(-1, -1)},
  {new Square(0, 0), new Square(0, 1), new Square(0, 2), new Square(-1, 0), new Square(-1, -1)},
  {new Square(0, 0), new Square(0, 1), new Square(0, -1), new Square(-1, 0), new Square(-1, -1)},
  {new Square(0, 0), new Square(0, 1), new Square(-1, 1), new Square(-1, -1), new Square(0, -1)},
  {new Square(0, 0), new Square(1, 0), new Square(0, 1), new Square(0, -1), new Square(0, -2)},
  {new Square(0, 0), new Square(1, 0), new Square(0, 1), new Square(-1, 0), new Square(0, 2)},
  {new Square(0, 0), new Square(1, 0), new Square(0, 1), new Square(2, 0), new Square(0, 2)},
  {new Square(0, 0), new Square(1, 0), new Square(0, 1), new Square(-1, 1), new Square(1, -1)},
  {new Square(0, 0), new Square(1, 0), new Square(-1, 0), new Square(-1, 1), new Square(1, -1)},
  {new Square(0, 0), new Square(1, 0), new Square(0, 1), new Square(-1, 0), new Square(-1, -1)},
  {new Square(0, 0), new Square(1, 0), new Square(0, 1), new Square(-1, 0), new Square(0, -1)}};
  
  Piece(int colorID_, int typeID_) {
    colorID = colorID_;
    typeID = typeID_;
    squareSet = pieceTypes[typeID];
    for (Square s : squareSet) {
      s.fillIt(colorID, typeID);
    }
  }
  */
