import java.util.*;

int canvasW = 7680;
int canvasH = 1080;
PGraphics canvas;

float minArea = 0;
float maxArea = 0;
int currentyear = 2000;
int yearText = 2000;
int currentIndex = 0;
float totalkm2 = 0;
float [] x;
float []  x2;
float []  x3;
float []  x4;
float []  x5;
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

  Collections.sort(data);

  for (Region r : data) {
    println(r);
  }

  int n = data.size();
  x = new float[n];
  x2 = new float[n];
  x3 = new float[n];
  x4 = new float[n];
  x5 = new float[n];

  //random X-Postitionen definieren*/
  for (int i = 0; i < data.size(); i++) {
    float nn = random(1353.26, 7675);
    x[i] =nn;
    float m = random(1353.26, 7675);
    x2[i] = m;
    float l = random(1353.26, 7675);
    x3[i] = l;
    float r = random(1353.26, 7675);
    x4[i] = r;
    float s = random(1353.26, 7675);
    x5[i] = s;
    float p = random(1353.26, 7675);
    x5[i] = p;
  };


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
