class Hexagon {
  float x = 0, y = 0, radi = 0;
  float angle = 360.0 / 6;
  boolean selected = false;
  boolean dirty = false;
  PShape hex;
  Hexagon(float cx, float cy, float r)
  {
    x=cx;
    y=cy;
    radi=r;
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

    if (selected) fill(0, 162, 255);
    else fill(abs(x-mouseX), abs(y-mouseY), 255-dist(mouseX, mouseY, x, y));

    stroke(0);

    hex.endShape(CLOSE);
    dirty = false;
  }
  void toggle() {
    selected = !selected;
    dirty = true;
  }
}

