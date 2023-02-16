/*
*
* Dynamic tree that grows with the mouse
*
*/

float theta;

float y_rot = 0.0;

void setup() {
  size(1000,750,P3D);
}

void draw() {
  camera();
  background(255);
  frameRate(100);
  stroke(0);
  float a = 2 * (mouseX / (float) width) * 90f;
  theta = radians(a);
  translate(width/2, height, 0);
  float L = ((height - mouseY) / (float) height) * height/2;
  line(0, 0, 0, 0, -L, 0);
  translate(0, -L, 0);
  branch(L);
  if (mousePressed) {
    y_rot += PI/16;
  }
  rotateY(y_rot);
}


void branch(float h) {
  h *= 0.66;
  
  if (h > 4){
    pushMatrix();
    rotate(theta);
    line(0, 0, 0, 0, -h, 0);
    translate(0, -h, 0);
    branch(h);
    popMatrix();
    
    
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, 0, -h, 0);
    translate(0, -h, 0);
    branch(h);
    popMatrix();
  }
}
