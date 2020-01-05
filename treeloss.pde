import java.util.*;

int canvasW = 7680;
int canvasH = 1080;
PGraphics canvas;

ArrayList<Region> data;

PImage img1; /*für Start und Legende*/
PImage img2; /*für Ende*/
PImage img3; /*für Ende 2*/
PImage img4; /*für Ende 2*/


boolean ready = false;


// Processing Standard Functions
void settings() 
{
  //size(1280, 180, P3D);
  size(canvasW/3, canvasH/3, P3D);
  PJOGL.profile=1;
}

void setup() {
  
     frameRate(20); ///2
     
     
  canvas = createGraphics(canvasW, canvasH, P3D);

  img1 = loadImage("Grafiken/neu_1.png");
  img2 = loadImage("Grafiken/neu_2.png");
  img3 = loadImage("Grafiken/neu_3.png");
  img4 = loadImage("Grafiken/neu_4.png");
  
  
    data =  loadData("treeloss.csv");




  ready = true;
}

void draw() {

  canvas.beginDraw();
  if (!ready) {
    canvas.background(255, 0, 0);
    return;
  }

  canvas.background(0);


  /* Erster Schnitt: Amazonas*/
  if (frameCount < 40) {
    canvas.background(img1);
  }


  canvas.endDraw();

  image(canvas, 0, 0, width, height);
}
