import controlP5.*;
ControlP5 cp5;
int myColor = color(0, 0, 0);


int n = 6;
int d = 72;
int size = 50;

//PVector points;
PVector[] points = new PVector[361];

boolean grblIt = false;

void setup() {
  senderInit("F10");
  size(400, 400);
  cp5 = new ControlP5(this);
  pushMatrix();
  cp5.addSlider("n")
    .setPosition(10, 10)
    .setRange(0, 100)
    ;

  cp5.addSlider("d")
    .setPosition(10, 20)
    .setRange(0, 100)
    ;

  cp5.addSlider("size")
    .setPosition(10, 30)
    .setRange(1, 250)
    ;

  cp5.addButton("grblit")
    .setPosition(10, 40)
    .setSize(100, 20)
    ;
  popMatrix();
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
}

public void grblit(int theValue) {
  println("a button event: "+theValue);
  for (int i=0; i<361; i++) {
    if (i==0) {
      println(i);
      moveTo(points[i].x, points[i].y, 50000);
      //println("moveTo(" + str(points[i].x) + ", " + str(points[i].y) + ");");
    } else {
      drawTo(points[i].x, points[i].y, 50000);
      //println("drawTo(" + str(points[i].x) + ", " + str(points[i].y) + ");");
    }
  }
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(1);

  pushMatrix();
  translate(width/2, height/2);
  noFill();

  beginShape();
  for (int i = 0; i<361; i++) {
    float k = i*d;
    float r = size*sin(n*k);
    float x = r * cos(k);
    float y = r * sin(k);

    points[i] = new PVector(x, y);
    //curveVertex(points[i].x, points[i].y);
    vertex(points[i].x, points[i].y);
  }
  endShape(CLOSE);
  popMatrix();
}
