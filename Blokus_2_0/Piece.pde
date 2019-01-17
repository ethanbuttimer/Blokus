//Describes a set of squares, 
//with an arrangement given by a typeID and the pieceTypeData,
//and a color given by the color ID.
//Includes methods for rotations and flips.

class Piece {
  private int colorID;
  private int typeID;
  private Square[] squareSet;
  
  //storage of all 21 shape types as a set of squares
  private int[][][] pieceTypeData = 
  {{{0, 0}},
  {{0, 0}, {0, 1}},
  {{0, 0}, {0, -1}, {0, 1}},
  {{0, 0}, {0, 1}, {1, 0}},
  {{0, 0}, {0, 1}, {0, -1}, {0, -2}},
  {{0, 0}, {-1, 0}, {0, 1}, {0, 2}},
  {{0, 0}, {1, 0}, {0, 1}, {0, -1}},
  {{0, 0}, {1, 0}, {0, 1}, {1, 1}},
  {{0, 0}, {1, 0}, {0, 1}, {-1, 1}},
  {{0, 0}, {0, 1}, {0, 2}, {0, -1}, {0, -2}},
  {{0, 0}, {0, 1}, {0, 2}, {0, -1}, {-1, -1}},
  {{0, 0}, {0, 1}, {0, 2}, {-1, 0}, {-1, -1}},
  {{0, 0}, {0, 1}, {0, -1}, {-1, 0}, {-1, -1}},
  {{0, 0}, {0, 1}, {-1, 1}, {-1, -1}, {0, -1}},
  {{0, 0}, {1, 0}, {0, 1}, {0, -1}, {0, -2}},
  {{0, 0}, {1, 0}, {0, 1}, {-1, 0}, {0, 2}},
  {{0, 0}, {1, 0}, {0, 1}, {2, 0}, {0, 2}},
  {{0, 0}, {1, 0}, {0, 1}, {-1, 1}, {1, -1}},
  {{0, 0}, {1, 0}, {-1, 0}, {-1, 1}, {1, -1}},
  {{0, 0}, {1, 0}, {0, 1}, {-1, 0}, {-1, -1}},
  {{0, 0}, {1, 0}, {0, 1}, {-1, 0}, {0, -1}}};
  
  Piece(int colorID_, int typeID_) {
    colorID = colorID_;
    typeID = typeID_;
    int[][] dataRow = pieceTypeData[typeID];
    squareSet = new Square[dataRow.length];
    for (int n = 0; n < dataRow.length; n++) {
      squareSet[n] = new Square(dataRow[n][0], dataRow[n][1]);
      squareSet[n].fillIt(colorID, typeID);
    }
  }
  
  //vertical flip
  void flipUD() {
    for (Square sqr : squareSet) {
      sqr.changePos(sqr.i, -sqr.j);
    }
  }
  
  //horizonal flip
  void flipLR() {
    for (Square sqr : squareSet) {
      sqr.changePos(-sqr.i, sqr.j);
    }
  }
  
  //clockwise turn
  void rotateCW() {
    for (Square sqr : squareSet) {
      sqr.changePos(-sqr.j, sqr.i);
    }
  }
  
  //counterclockwise turn
  void rotateCCW() {
    for (Square sqr : squareSet) {
      sqr.changePos(sqr.j, -sqr.i);
    }
  }
  
  void transReset() {
    for (int n = 0; n < squareSet.length; n++) {
      squareSet[n].changePos(pieceTypeData[typeID][n][0], pieceTypeData[typeID][n][1]);
    }
  }
  
  void show() {
    for (Square sqr : squareSet) {
      sqr.show();
    }
  }
}
