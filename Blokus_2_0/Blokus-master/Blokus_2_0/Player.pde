class Player {
  private Piece[] inventory = new Piece[21];
  private Board invBoard;
  private int colorID;
  private int points;
  private String colorString;
  private boolean playedLastTurn = true;
  
  Player(int colorID_) {
    colorID = colorID_;
    invBoard = new Board(32, 7, 660, 445, 0.5);
    for (int i = 0; i < 21; i++) {
      inventory[i] = new Piece(colorID, i);
    }
    points = 0;
    switch (colorID) {
      case 0: colorString = "Red";
              break;
      case 1: colorString = "Green";
              break;
      case 2: colorString = "Yellow";
              break;
      case 3: colorString = "Blue";
              break;
    }
  }
  
  //specifies position of each piece in a single player's inventory. 
  //Will place nothing if corresponding inventory entry is null.
  void fillInventory() {
    invBoard.placePiece(0, 6, inventory[0]);
    invBoard.placePiece(2, 5, inventory[1]);
    invBoard.placePiece(4, 5, inventory[2]);
    invBoard.placePiece(6, 5, inventory[3]);
    invBoard.placePiece(10, 5, inventory[4]);
    invBoard.placePiece(13, 4, inventory[5]);
    invBoard.placePiece(15, 5, inventory[6]);   
    invBoard.placePiece(18, 5, inventory[7]);
    invBoard.placePiece(22, 5, inventory[8]);
    invBoard.placePiece(0, 2, inventory[9]);
    invBoard.placePiece(20, 1, inventory[10]);
    invBoard.placePiece(23, 1, inventory[11]);
    invBoard.placePiece(27, 5, inventory[12]);
    invBoard.placePiece(13, 1, inventory[13]);
    invBoard.placePiece(2, 2, inventory[14]);
    invBoard.placePiece(5, 0, inventory[15]);
    invBoard.placePiece(15, 0, inventory[16]);
    invBoard.placePiece(8, 1, inventory[17]);
    invBoard.placePiece(26, 1, inventory[18]);
    invBoard.placePiece(30, 1, inventory[19]);
    invBoard.placePiece(30, 5, inventory[20]);
    
    invBoard.show();
  }
  
  void removeFromInventory(Piece p) {
    if (p != null) {
      inventory[p.typeID] = null;
      invBoard.reset();
      fillInventory();
    }
  }
  
  void addToInventory(Piece p) {
    if (p != null) {
      inventory[p.typeID] = p;
      invBoard.reset();
      fillInventory();
    }
  }
}
