/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/49239*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
float[] values = new float[16];
float[] values1 = new float[16];

float plotX1, plotX2, plotY1, plotY2;
int leftMargin = 20;
int topMargin = 100;
int plotHeight = 250;
float timer = 0.0;
PFont helvetica;
String url;
int[] ipA = new int[16];
int[] ipB = new int[16];
int[] ipC = new int[16];
int[] ipD = new int[16];

int[] ip1A = new int[16];
int[] ip1B = new int[16];
int[] ip1C = new int[16];
int[] ip1D = new int[16];

String[] IPvalue1 = new String[16];

//trying to convert string to float
//float IPvalue1NUM = Float.valueOf(IPvalue1[0]).floatValue();


void setup() {
  size(640, 480);
  smooth();
  helvetica = createFont("Helvetica-Bold", 20);
  textFont(helvetica);

  generateValues();

  // set plot size
  plotX1 = leftMargin;
  plotX2 = width - leftMargin;
  plotY1 = topMargin;
  plotY2 = height - topMargin;
}

void draw() {
  background(100, 200, 200);
  text("Traceroute: " + url, 20, 60);

  // draw plot bg
  fill(40);
  noStroke();
  rectMode(CORNERS);
  rect(plotX1, plotY1, plotX2, plotY2);

  line(plotX1, height - topMargin, plotX2, height - topMargin);
  line(plotX1, height - topMargin, plotX1, height - topMargin - plotHeight);

  noFill();

  strokeWeight(2);  


  float x, y;

  /*
  // double curve vertext points
   x = map(0, 0, values.length-1, plotX1, plotX2);
   y = map(values[0], 0, 200, height - topMargin, height - topMargin - plotHeight);
   curveVertex(x, y);
   */


  //1st trace route
  stroke(255);
  beginShape();
  for (int i = 0; i < values.length; i++) {
    x = map(i, 0, values.length-1, plotX1, plotX2);
    y = map(values[i], 0, 200, height - topMargin, height - topMargin - plotHeight); 
    vertex(x, y);
  }
  endShape();




  //2nd traceroute
  stroke(255, 0, 0);
  beginShape();

  for (int i = 0; i < values1.length; i++) {
    x = map(i, 0, values1.length-1, plotX1, plotX2);
    y = map(values1[i], 0, 200, height - topMargin, height - topMargin - plotHeight); 
    vertex(x, y);
  }

  /*
  // double curve vertext points
   x = map(values.length-1, 0, values.length-1, plotX1, plotX2);
   y = map(values[values.length-1], 0, 200, height - topMargin, height - topMargin - plotHeight);
   curveVertex(x, y); 
   */

  endShape();

  // draw points on mouse over
  for (int i = 0; i < values.length; i++) {
    x = map(i, 0, values.length-1, plotX1, plotX2);
    y = map(values[i], 0, 200, height - topMargin, height - topMargin - plotHeight);

    // check mouse pos
    // float delta = dist(mouseX, mouseY, x, y);
    float delta = abs(mouseX - x);
    if ((delta < 15) && (y > plotY1) && (y < plotY2)) {
      stroke(255);
      fill(0);
      ellipse(x, y, 8, 8);

      int labelValA = ipA[i];
      int labelValB = ipB[i];
      int labelValC = ipC[i];
      int labelValD = ipD[i];


      //values[i];
      Label label = new Label("" + labelValA + "." + labelValB + "." + labelValC + "." + labelValD, x, y);
    }
  }
}

void keyPressed() {
  generateValues();
}

