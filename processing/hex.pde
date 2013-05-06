class Hexagon {
  float x = 0, y = 0;
  boolean selected = false;
  boolean dirty = true;
  PShape hex;
  Hexagon(float cx, float cy,PShape hexagon) {
    x = cx;
    y = cy;
	console.log(cx);
    hex = hexagon;
    display();
  }

  void display() {
    if (dirty) {
      hex.disableStyle();
      if (selected) fill(0, 162, 255);
      else fill(255, 255, 255);
      stroke(0);
      smooth();
      shapeMode(CENTER);
      shape(hex, x, y, 60, 52);
      dirty = false;
    }
  }
  void buildShape() {
    hex.disableStyle();
    if (selected) fill(0, 162, 255);
    else fill(255, 255, 255);
    smooth();
    shape(hex, x, y, 60, 52);
    dirty = false;
  }
  void toggle() {
    selected = !selected;
    dirty = true;
  }
}

