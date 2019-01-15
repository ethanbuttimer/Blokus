class Button {
  int x, y;
  int sizeX, sizeY;
  color baseColor, pressedColor;
  boolean pressed = false;
  PImage imgFile;
  String text;
  
  //initializes the displayed text, position, size, and colors.
  Button(String text_, int x_, int y_, int sizeX_, int sizeY_, 
         color baseColor_, color pressedColor_) {
    text = text_;
    x = x_;
    y = y_;
    sizeX = sizeX_;
    sizeY = sizeY_;

    pressedColor = pressedColor_;
    baseColor = baseColor_;
  }
  
  void giveImage(PImage img) {
    imgFile = img;
  }

  boolean under(int mx, int my) {
    return (mx >= x && mx <= x+sizeX && my >= y && my <= y+sizeY);
  }

  void display() {
    stroke(255);
    if (pressed) {
      fill(pressedColor);
    } else {
      fill(baseColor);
    }
    rect(x, y, sizeX, sizeY);
    fill(255);
    textSize(sizeY * 0.8);
    text(text, x + sizeY * 0.2, y + sizeY * 0.8);
    if (imgFile != null) {
      image(imgFile, x + (sizeX - imgFile.width)/2 , y + (sizeY - imgFile.height)/2);
    }
  }
  
  void reset() {
    pressed = false;
  }
  
  Button clone(int newX, int newY) {
    return new Button(text, newX, newY, sizeX, sizeY, baseColor, pressedColor);
  }
}
