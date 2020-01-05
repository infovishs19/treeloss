import java.util.*;

int canvasW = 7680;
int canvasH = 1080;
PGraphics canvas;

// Processing Standard Functions
void settings() 
{
  //size(1280, 180, P3D);
  size(canvasW/3, canvasH/3, P3D);
  PJOGL.profile=1;
}

void setup() {
  canvas = createGraphics(canvasW, canvasH, P3D);
  
  
  
}

void draw(){
canvas.beginDraw();
canvas.background(255,0,0);
canvas.endDraw();

image(canvas,0,0,width,height);
}
