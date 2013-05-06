/* @pjs preload="/link/processing/data/Hexagon.svg"; */

Hexagon[][] hex;
int RADIUS = 30;
int columns, rows;
int H;
int S;
PShape hexagon;
public void setup() {
  size(screenWidth, screenHeight);
  hexagon = loadShape("/link/processing/data/Hexagon.svg");
  S = (3 * RADIUS) / 2;
  H = (int)(sqrt(3) * RADIUS);
  columns = (screenWidth/(S))+2;
  rows = (screenHeight/(H))+1;
  noLoop();
  
  hex = new Hexagon[columns][rows];

  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
        hex[i][j] = new Hexagon((i * S), (H *(j + (i % 2)*.5)), hexagon);    
    }
  }
  draw();
}

public void draw() {
  for (int i = 0; i < columns; i ++ ) {     
    for (int j = 0; j < rows; j ++ ) {
      hex[i][j].display();
    }
  }
  fill(0);
  text("FPS: "+frameRate, 130, 130);
}

void mouseReleased() {
  int x = mouseX+RADIUS;
  int y = mouseY+RADIUS;
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
 if (hex[i][j] != null){
   hex[i][j].toggle();
   redraw();
 }
}

