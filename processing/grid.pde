Hexagon[][] hex;
int RADIUS = 30;
int columns, rows;
int H;
int S;
public void setup() {
  //  size(window.innerWidth, window.innerHeight);
  size(1000, 1000, P2D);
  smooth();
  //  frameRate(50);
  noStroke();
  columns = (height/(RADIUS));
  rows = (width/(RADIUS)*2);

  S = (3 * RADIUS) / 2;
  H = (int)(sqrt(3) * RADIUS);
  println("side: "+S+" , height: "+H);
  hex = new Hexagon[columns][rows];

  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      hex[i][j] = new Hexagon(i * S, H *(j + (i % 2)*.5), RADIUS, i , j);
    }
  }
}

public void draw() {
  for (int i = 0; i < columns; i ++ ) {     
    for (int j = 0; j < rows; j ++ ) {
      hex[i][j].display();
    }
  }
  fill(0);
  text("FPS: "+frameRate, 30, 30);
}

void mouseReleased() {
  int x = mouseX;
  int y = mouseY;
  int i, j;
  int ci = (int)floor((float)x/(float)S);
  int cx = x - S*ci;

  int ty = y - (ci % 2) * H / 2;
  int cj = (int)floor((float)ty/(float)H);
  int cy = ty - H*cj;

  if (cx > Math.abs(RADIUS / 2 - RADIUS * cy / H)) {
    selectCell(ci, cj);
  } 
  else {
    selectCell(ci - 1, cj + (ci % 2) - ((cy < H / 2) ? 1 : 0));
  }

 
}
void selectCell(int i, int j){
 if (hex[i][j] != null)hex[i][j].toggle();
}

