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
float []  x6;
ArrayList<Region> data;

PImage img1; /*für Start und Legende*/
PImage img2; /*für Ende*/
PImage img3; /*für Ende 2*/
PImage img4; /*für Ende 2*/


boolean ready = false;

PFont font;
PFont fontBold;


// Processing Standard Functions
void settings() 
{
  //size(1280, 180, P3D);
  size(canvasW/3, canvasH/3, P3D);
  PJOGL.profile=1;
}

void setup() {

  frameRate(20); ///2


  font = createFont("fonts/Roboto-Regular.ttf",30);
  fontBold = createFont("fonts/Roboto-Bold.ttf",30);
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
   x6 = new float[n];

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
    x6[i] = p;
  };


  currentIndex = data.size() - 1;

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
  /* Zweiter weiter Schnitt: Animation* 170 Frames lang*/
  else if (frameCount < 200) {
    println("aktueller Framecount" + frameCount)

     canvas.background(img2); /*Platzierung Legende*/

    println("Wir sind im Jahr " + yearText);

    for (int i = 0; i < currentIndex; i++) {

      /*Acre*/
      if (data.get(i).region.equals("Acre")) {
        canvas.fill(146, 156, 158, 190);
      }
      /*Amapa*/
      if (data.get(i).region.equals("Amapá")) {
        canvas.fill(124, 144, 184, 190);
      }
      /*Amazonas*/
      if (data.get(i).region.equals("Amazonas")) {
        canvas.fill(139, 129, 76, 190);
      }
      /*Maranhão*/
      if (data.get(i).region.equals("Maranhão")) {
        canvas.fill(138, 156, 38, 190);
      }
      /*Mato Grosso*/
      if (data.get(i).region.equals("Mato Grosso")) {
        canvas.fill(32, 52, 27, 190);
      }
      /*Para*/
      if (data.get(i).region.equals("Pará")) {
        canvas.fill(66, 171, 52, 190);
      }
      /*Rondônia*/
      if (data.get(i).region.equals("Rondônia")) {
        canvas.fill(97, 76, 28, 190);
      }
      /*Roraima*/
      if (data.get(i).region.equals("Roraima")) {
        canvas.fill(203, 230, 225, 190);
      }
      /*Tocantins*/
      if (data.get(i).region.equals("Tocantins")) {
        canvas.fill(62, 56, 29, 190);
      }

      canvas.noStroke();

      //if(data[i].jahr>currentyear){

      float w = map(data.get(i).km2, 0, 15733, 0, (canvas.width - 1353.26) / 15);

      if (data.get(i).km2 > 1000) {
        canvas.rect(x[i], 0, w / 2.0, canvas.height);
        canvas.rect(x2[i], 0, w / 2.0, canvas.height);
      } else if (data.get(i).km2 > 2000) {
        canvas.rect(x[i], 0, w / 3.0, canvas.height);
        canvas.rect(x2[i], 0, w / 3.0, canvas.height);
        canvas.rect(x3[i], 0, w / 3.0, canvas.height);
      } else if (data.get(i).km2 > 3000) {
        canvas.rect(x[i], 0, w / 4.0, canvas.height);
        canvas.rect(x2[i], 0, w / 4.0, canvas.height);
        canvas.rect(x3[i], 0, w / 4.0, canvas.height);
        canvas.rect(x4[i], 0, w / 4.0, canvas.height);
      } else if (data.get(i).km2 > 4000) {
        canvas.rect(x[i], 0, w / 5.0, canvas.height);
        canvas.rect(x2[i], 0, w / 5f, canvas.height);
        canvas.rect(x3[i], 0, w / 5f, canvas.height);
        canvas.rect(x4[i], 0, w / 5f, canvas.height);
        canvas.rect(x5[i], 0, w / 5f, canvas.height);
      } else if (data.get(i).km2 > 5000) {
        canvas.rect(x[i], 0, w / 6f, canvas.height);
        canvas.rect(x2[i], 0, w / 6f, canvas.height);
        canvas.rect(x3[i], 0, w / 6f, canvas.height);
        canvas.rect(x4[i], 0, w / 6f, canvas.height);
        canvas.rect(x5[i], 0, w / 6f, canvas.height);
        canvas.rect(x6[i], 0, w / 6f, canvas.height);
      } else {
        canvas.rect(x[i], 0, w, canvas.height);
      }
    }

    /*Beschriftung Jahr und Quadratkilometer*/
    if (yearText < 2019) {

      /*Text links*/
      canvas.textSize(30);
      canvas.textAlign(RIGHT);
      canvas.fill(255);
      canvas.noStroke();
      canvas.textFont(fontBold);
      //textStyle(BOLD);
      canvas.text("Verlust im Jahr", 1075, 950, 250, 500);
        canvas.text(yearText + " seit 2001:", 1075, 985, 250, 500)
       canvas.text(round(totalkm2) + " km²", 1015, 1020, 300, 500)

      /*Text rechts*/
      canvas.fill(0);
      canvas.rect(7386, 935, 280, 130);
      canvas.textSize(30);

      canvas.textAlign(RIGHT);
      canvas.fill(255);
      canvas.noStroke();
      canvas.textFont(fontBold);
      //textStyle(BOLD);
      canvas.text("Verlust im Jahr", 7386, 950, 250, 500)
        canvas.text(yearText + " seit 2001:", 7386, 985, 250, 500)
        canvas.text(round(totalkm2) + " km²", 7326, 1020, 300, 500)
        yearText = data.get(currentIndex).jahr; //yearText = yearText + 1;
    }

    totalkm2 = totalClearedForest();
    //currentyear = currentyear + 1;

    currentIndex = currentIndex - 1;
    if (currentIndex < 0) {
      currentIndex = 0;
    }

    yearText = data.get(currentIndex).jahr;

    //if (doSave) {
    //  saveCanvas("frame_" + nf(frameCount, 5) + '.png');
    //}
  }

  /* Dritter Schnitt: Europa*/
  else if (frameCount < 220) {
    canvas.background(img3);
  }

  /* Vierter Schnitt: Mensch*/
  else if (frameCount < 250) {
     canvas.background(img4);
  }


  canvas.endDraw();

  image(canvas, 0, 0, width, height);
}
