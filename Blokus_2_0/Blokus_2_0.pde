// Blokus

import processing.sound.*;

//sounds
SoundFile click;
SoundFile error;
SoundFile swoosh;
SoundFile flip;
SoundFile tada;

Board finalBoard;
Board panel;
Player p1;
Player p2;

boolean inSetup = true;
boolean gameEnded = false;

Player currentPlayer;
Player otherPlayer;
Button activeButton;
int[] panelSelection;
boolean currentTurnPlayed = false;

Piece panelPiece;
Piece phantomPiece;
int phantomI;
int phantomJ;
boolean phantomPiecePlaced;

ArrayList<Button> buttonList = new ArrayList<Button>();

//for start window
Button redButton1 = new Button("Red", 690, 340, 90, 30, color(255, 0, 0), color(200, 60, 60));
Button greenButton1 = new Button("Green", 800, 340, 90, 30, color(0, 200, 0), color(60, 255, 60));
Button yellowButton1 = new Button("Yellow", 910, 340, 90, 30, color(200, 200, 0), color(255, 255, 0));
Button blueButton1 = new Button("Blue", 1020, 340, 90, 30, color(0, 0, 255), color(120, 120, 255));
Button redButton2 = redButton1.clone(690, 430);
Button greenButton2 = greenButton1.clone(800, 430);
Button yellowButton2 = yellowButton1.clone(910, 430);
Button blueButton2 = blueButton1.clone(1020, 430);
Button startButton = new Button("Start", 845, 500, 110, 50, color(0), color(150));
PImage icon;
PImage woodBackground;
PImage blackTexture;
PImage blackBorder;

//for turn window
Button rotateCCWButton = new Button("", 780, 350, 60, 60, color(150), color(200));
Button rotateCWButton = rotateCCWButton.clone(840, 350);
Button flipLRButton = rotateCCWButton.clone(900, 350);
Button flipUDButton = rotateCCWButton.clone(960, 350);
Button finishButton = new Button("Finish Turn", 690, 40, 90, 18, color(0), color(150));
Button resetButton = new Button("Reset Turn", 800, 40, 90, 18, color(0), color(150));
Button passButton = new Button("Pass Turn", 910, 40, 90, 18, color(0), color(150));
Button endButton = new Button("End Game", 1020, 40, 90, 18, color(0), color(150));
PImage rotationCW;
PImage rotationCCW;
PImage arrowLR;
PImage arrowUD;

//for end window
Button exitButton = new Button("Exit Game", 800, 330, 200, 45, color(0), color(150));

void setup() {
  size(1200, 600);
  finalBoard = new Board(14, 14, 90, 90, 1);
  panel = new Board(5, 5, 795, 115, 1.4);
  
  icon = loadImage("blokusTitle.jpg");
  rotationCCW = loadImage("rotateCCW.png");
  rotationCW = loadImage("rotateCW.png");
  arrowLR = loadImage("arrowLR.png");
  arrowUD = loadImage("arrowUD.png");
  woodBackground = loadImage("Wood-Background-Images.jpg");
  blackTexture = loadImage("black-texture2.jpg");
  blackBorder = loadImage("black-texture.jpg");
  
  click = new SoundFile(this, "clickoff.wav");
  error = new SoundFile(this, "error1.wav");
  swoosh = new SoundFile(this, "whoosh.wav");
  flip = new SoundFile(this, "switch.wav");
  tada = new SoundFile(this, "tada.wav");
  
  rotateCCWButton.giveImage(rotationCCW);
  rotateCWButton.giveImage(rotationCW);
  flipLRButton.giveImage(arrowLR);
  flipUDButton.giveImage(arrowUD);
  
  setUpStartInterface();
}


//window setups



void setUpStartInterface() {
  buttonList.add(redButton1);
  buttonList.add(greenButton1);
  buttonList.add(yellowButton1);
  buttonList.add(blueButton1);
  buttonList.add(redButton2);
  buttonList.add(greenButton2);
  buttonList.add(yellowButton2);
  buttonList.add(blueButton2);
  buttonList.add(startButton);
  
  displayBackground();
  textSize(24);
  text("Player 1: Please pick your color:", 720, 320);
  text("Player 2: Please pick your color:", 720, 410);
  image(icon, 770, 30);
}

void setUpTurnInterface() {
  buttonList.clear();
  buttonList.add(rotateCCWButton);
  buttonList.add(rotateCWButton);
  buttonList.add(flipLRButton);
  buttonList.add(flipUDButton);
  buttonList.add(finishButton);
  buttonList.add(resetButton);
  buttonList.add(passButton);
  buttonList.add(endButton);
  
  panelPiece = null;
  phantomPiece = null;
  resetButtons();
  panel.reset();
  panel.show();
  currentPlayer.fillInventory();
  currentTurnPlayed = false;
  phantomPiecePlaced = false;
}

void setUpEndInterface() {
  gameEnded = true;
  buttonList.clear();
  buttonList.add(exitButton);
  displayBackground();
  tada.play();
  
  textSize(40);
  fill(255);
  String message = "It's a tie!";
  int scoreDiff = p1.points - p2.points;
  String endPart = " squares!";
  if (abs(scoreDiff) == 1) {
    endPart = " square!";
  }
  if (scoreDiff > 0) {
    message = ("Player 1 wins by " + scoreDiff + endPart);
    text(message, 640, 300);
  } else if (scoreDiff < 0) {
    message = ("Player 2 wins by " + -scoreDiff + endPart);
    text(message, 640, 300);
  } else {
    text(message, 815, 300);
  }
}

void displayBackground() {
  image(woodBackground, 0, 0, 600, 600);
  image(blackBorder, 595, 0, 605, 600);
  image(blackTexture, 605, 0, 585, 600);
}



//Buttons and controls



void displayButtons() {
  for (Button but : buttonList) {
    but.display();
  }
}

void resetButtons() {
  for (Button but : buttonList) {
    but.reset();
  }
}

void activateButton(int buttonNum, boolean setup) {
  boolean result;
  if (setup) {
    if (buttonNum == 8) {
      result = startB();
      click.play();
    } else {
      result = colorSelect(buttonNum % 4, buttonNum / 4 + 1);
      click.play();
    }
  } else if (!gameEnded) {
    if (buttonNum < 4) {
      result = transformationReset(panelPiece, buttonNum);
    } else {
      result = controls(buttonNum);
      click.play();
    }
  } else {
    result = true;
    exit();
  }
  if (!result) {
    beepBoop();
  }
}

boolean startB() {
  if (p1 != null && p2 != null && p1.colorID != p2.colorID) {
    inSetup = false;
    currentPlayer = p1;
    otherPlayer = p2;
    displayBackground();
    setUpTurnInterface();
  }
  return !inSetup;
}

boolean colorSelect(int colorID, int playerNum) {
  if (playerNum == 1) {
    p1 = new Player(colorID);
    finalBoard.positions[4][4].giveMarker(colorID);
  } else {
    p2 = new Player(colorID);
    finalBoard.positions[9][9].giveMarker(colorID);
  }
  return true;
}

boolean transformationReset(Piece p, int transID) {
  if (p == null) {
     return false;
  }
  panel.reset();
  switch (transID) {
    case 0: p.rotateCCW();
            swoosh.play();
            break;
    case 1: p.rotateCW();
            swoosh.play();
            break; 
    case 2: p.flipLR();
            flip.play();
            break;
    case 3: p.flipUD();
            flip.play();    
            break; 
  }
  placeOnPanel(p);
  return true;
}

boolean controls(int buttonNum) {
  if (buttonNum == 4) {
    if (currentTurnPlayed) {
      finalBoard.placePiece(phantomI, phantomJ, phantomPiece);
      currentPlayer.points += phantomPiece.squareSet.length;
      currentPlayer.playedLastTurn = true;
      swapPlayers();
      setUpTurnInterface();
    } else {
      return false;
    }
  } else if (buttonNum == 5) {
    panel.reset();
    resetButtons();
    resetTurnPieces();
    currentTurnPlayed = false;
    phantomPiecePlaced = false;
  } else if (buttonNum == 6) {
    if (!otherPlayer.playedLastTurn) {
      setUpEndInterface();
    } else {
      currentPlayer.playedLastTurn = false;
      resetTurnPieces();
      swapPlayers();
      setUpTurnInterface();
    }
  } else if (buttonNum == 7) {
    setUpEndInterface();
  }
  return true;
}

void resetTurnPieces() {
  if (panelPiece != null) {
    panelPiece.transReset();
    currentPlayer.addToInventory(panelPiece);
    panelPiece = null;
  }
  if (phantomPiece != null) {
    phantomPiece.transReset();
    currentPlayer.addToInventory(phantomPiece);
    phantomPiece = null;
  }
}

void swapPlayers() {
  Player temp = currentPlayer;
  currentPlayer = otherPlayer;
  otherPlayer = temp;
}

void placeOnPanel(Piece p) {
  panel.placePiece(2, 2, p);
}

void beepBoop() {
  error.play();
}


//user interaction


void mousePressed() {
  if (mouseX > 600) {
    for (int i = 0; i < buttonList.size(); i++) {
      Button but = buttonList.get(i);
      if (but.under(mouseX, mouseY)) {
        but.pressed = true;
        activeButton = but;
      }
    }
    if (!inSetup) {
      if (currentPlayer.invBoard.onBoard(mouseX, mouseY) && !currentTurnPlayed) {
        int selectedPieceID = currentPlayer.invBoard.getPieceType(mouseX, mouseY);
        if (selectedPieceID != -1) {
          panelPiece = currentPlayer.inventory[selectedPieceID];
          panel.placePiece(2, 2, panelPiece);
          currentPlayer.removeFromInventory(panelPiece);
        }
      } else if (panel.onBoard(mouseX, mouseY)) {
        panelSelection = panel.mouseLocation(mouseX, mouseY);
      }
    }
  } else if (!inSetup && panelSelection != null && panelPiece != null) {
    int[] boardSelection = finalBoard.mouseLocation(mouseX, mouseY);
    int i = boardSelection[0] - panelSelection[0] + 2;
    int j = boardSelection[1] - panelSelection[1] + 2;
    if (finalBoard.makeChecks(i, j, panelPiece)) {
      phantomPiece = panelPiece;
      phantomI = i;
      phantomJ = j;
      phantomPiecePlaced = true;
      panelPiece = null;
      panel.reset();
      currentTurnPlayed = true;
    } else {
      beepBoop();
    }
  }
}

void mouseReleased() {
  if (activeButton != null) {
    activateButton(buttonList.indexOf(activeButton), inSetup);
    activeButton.reset();
    activeButton = null;
  }
}

void pieceAnimations() {
  if (phantomPiecePlaced) {
    showPhantom();
  }
}

//draws the piece the current player intends to place, before being committed by finish button
void showPhantom() {
  pushMatrix();
  translate(finalBoard.insetsX + 30 * phantomI, finalBoard.insetsY + 30 * phantomJ);
  phantomPiece.show();
  popMatrix();
}
  
void draw() {
  frameRate(20); 
  displayButtons();
  finalBoard.show();
  if (!inSetup && !gameEnded) {
    panel.show();
    currentPlayer.invBoard.show();
    pieceAnimations();
  }
}
