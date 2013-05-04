class Hexagon {
  float x = 0, y = 0, radi = 0;
  float angle = 360.0 / 6;
  boolean selected = false;
  boolean dirty = false;
  int i,j;
  PShape hex;
  Hexagon(float left, float top, float r , int _i, int _j){
    x = left + r;
    y = top + r;
    radi = r;
    i = _i;
    j = _j;
    buildShape();
  }

  void display() {
    if(dirty) buildShape();
    shape(hex);
  }
  void buildShape() {
    hex = createShape();
    hex.beginShape();
    for (int i = 0; i < 6; i++) {
      hex.vertex(x + radi * cos(radians(angle * i)), y + radi * sin(radians(angle * i)));
    }

//    if (selected) fill(0, 162, 255);
//    else fill(255,255,255);

    stroke(0,55);
    hex.endShape(CLOSE);
    
    dirty = false;
  }
  void toggle() {
    selected = !selected;
    dirty = true;
  }
}

