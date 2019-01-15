class Board {
  Square[][] positions;
  Piece phantomPiece;
  int cols;
  int rows;
  int insetsX;
  int insetsY;
  float scaler;
  
  //initializes attributes: number of columns, rows; coordinates of top left corner of board as insets; scaling parameter.
  //fills positions array with unfillled squares
  Board(int cols_, int rows_, int insetsX_, int insetsY_, float scaler_) {
    cols = cols_;
    rows = rows_;
    insetsX = insetsX_;
    insetsY = insetsY_;
    scaler = scaler_;
    positions = new Square[cols][rows];
    reset();
  }
  
  void reset() {
    for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      positions[i][j] = new Square(i, j);
    }
    }
  }
  
  //checks all squares in a piece for legal placement and determines if at least one square is at the corner of a same color piece.
  boolean makeChecks(int i, int j, Piece p) { 
    if (p != null) {
      boolean isAtCorner = false;
      for (Square sqr : p.squareSet) {
        int resultCase = placementLegal(i, j, sqr);
        if (resultCase == 3) {
          return true;
        }
        if (resultCase == 0) {
          return false;
        } else if (resultCase == 2) {
          isAtCorner = true;
        }
      }
      return isAtCorner;
    }
    return false;
  }
  
  //fills all squares on board corresponding to the piece
  void placePiece(int i, int j, Piece p) {
    if (p == null) {return;}
    for (Square sqr : p.squareSet) {
       fillPosition(sqr.i + i, sqr.j + j, p);
    }
  }
  
  //case 0: not legal. case 1: legal. case 2: legal and at corner. case 3: first turn, on colorMarker square.
  int placementLegal(int i, int j, Square sqr) {
    int x = sqr.i + i;
    int y = sqr.j + j;
    Square position;
    
    //tests that new square is on the board 
    try {
      position = positions[x][y];
    } catch (ArrayIndexOutOfBoundsException e) {
      return 0;
    }
    
    if (position.colorMarker && position.colorID == sqr.colorID) {
      return 3;
    }
    
    //tests that new square is not overlapping an existing piece
    if (position.filled) {
      return 0;  
    }
    
    ArrayList<Square> neighbors = new ArrayList<Square>();
    ArrayList<Square> diagonals = new ArrayList<Square>();
    
    try {neighbors.add(positions[x+1][y]);} catch (ArrayIndexOutOfBoundsException e) {}
    try {neighbors.add(positions[x][y+1]);} catch (ArrayIndexOutOfBoundsException e) {}
    try {neighbors.add(positions[x-1][y]);} catch (ArrayIndexOutOfBoundsException e) {}
    try {neighbors.add(positions[x][y-1]);} catch (ArrayIndexOutOfBoundsException e) {}
    try {diagonals.add(positions[x+1][y+1]);} catch (ArrayIndexOutOfBoundsException e) {}
    try {diagonals.add(positions[x-1][y+1]);} catch (ArrayIndexOutOfBoundsException e) {}
    try {diagonals.add(positions[x+1][y-1]);} catch (ArrayIndexOutOfBoundsException e) {}
    try {diagonals.add(positions[x-1][y-1]);} catch (ArrayIndexOutOfBoundsException e) {}
    
    //tests for neighbors of same color
    for (Square n : neighbors) {
      if (n.filled && n.colorID == sqr.colorID) {
        return 0;
      }
    }
    //tests for diagonal with same color
    for (Square d : diagonals) {
      if (d.filled && d.colorID == sqr.colorID) {
        return 2;
      }
    }
    //all tests passed
    return 1; 
  }
  
  void fillPosition(int i, int j, Piece p) {
    positions[i][j].fillIt(p.colorID, p.typeID);
  }
  
  //rendering board base and squares
  void show() {
    pushMatrix();
    translate(insetsX, insetsY);
    scale(scaler);
    for (int i = 10; i > 0; i--) {
      noStroke();
      fill(192-10*i, 192-10*i, 192-10*i);
      rect(-i, -i, 30 * cols + 2 * i, 30 * rows + 2 * i);
    }
    for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      positions[i][j].show();
    }
    }
    popMatrix();
  }
  
  boolean onBoard(int mx, int my) {
    float squareWidth = 30 * scaler;
    float rightBound = insetsX + cols * squareWidth;
    float upperBound = insetsY + rows * squareWidth;
    return (mx >= insetsX && mx <= rightBound && my >= insetsY && my <= upperBound);
  }
  
  //returns two integers specifying coordinates of mouse on a board
  int[] mouseLocation(int mx, int my) {
    int xLoc = -1;
    int yLoc = -1;
    float squareWidth = 30 * scaler;
    
    if (onBoard(mx, my)) {
      xLoc = (int) ((mx - insetsX) / squareWidth);
      yLoc = (int) ((my - insetsY) / squareWidth);
    }
    int[] location = {xLoc, yLoc};
    return location;
  }
  
  int getPieceType(int mx, int my) {
    int[] coords = mouseLocation(mx, my);
    int x = coords[0];
    int y = coords[1];
    if (x > -1 && y > -1) {
      return positions[x][y].pieceTypeID;
    }
    return -1;
  }
}
