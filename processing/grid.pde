Hexagon[][] hex;
int radius = 30;
int columns, rows;
float S,H;
public void setup() {
//  size(window.innerWidth, window.innerHeight);
  size(1000,1000,P2D);
  smooth();
//  frameRate(50);
  noStroke();
  columns = (height/(radius));
  rows = (width/(radius)*2);
  
  S = (3 * radius) / 2;
  H = sqrt(3) * radius;

  hex = new Hexagon[columns][rows];
  
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
        hex[i][j] = new Hexagon(3 * radius * (i + (j % 2)*.5), .866 * radius * j, radius);
    }
  }
}

public void draw() {
  for (int i = 0; i < columns; i ++ ) {     
    for (int j = 0; j < rows; j ++ ) {
      try {
        hex[i][j].display();
      }
      catch(Exception e) {
      }
    }
  }
  fill(0);
  text("FPS: "+frameRate,30,30);
  
}

void mouseReleased() {
  int i_t = floor(mouseX / S);
  float y_t_s = mouseY -(i_t%2*(H / 2));
  int j_t = floor(y_t_s / H);
  float x_t = mouseX - (i_t * S);
  float y_t = y_t_s - j_t * H;

  int i, j;
  if (x_t > radius * abs(.5 - (y_t / H))) {
    i = i_t;
    j = j_t;
  }
  else {
    i = i_t - 1;
    int d_j = 0;
    if (y_t > (H / 2)) d_j = 1;

    j = j_t - i%2 + d_j;
  }

  if(hex[i][j] != null)hex[i][j].toggle();
}

