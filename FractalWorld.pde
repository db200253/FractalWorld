Mandelbrot mandel;

void setup() {
  // P2D = accelerate 
  // higher resolution
  size(960, 720, P2D);
  mandel = new Mandelbrot(-2.5, -1.5, 4, 300);
  mandel.dessiner();
}

void draw() {
  //mandel.zoom(423, 321, 1.01);
  //mandel.dessiner();
  //if (frameCount == 1000) {
  //  float fps = frameCount * 1000.0 / millis();
  //  println(fps, "fps");
  //  noLoop();
  //}
}

// Zoom 
void mouseWheel(MouseEvent event) {
  mandel.zoom(mouseX, mouseY, 1 - event.getCount() / 10.0);
  mandel.dessiner();
}

// Move around the fractal representation
void mouseDragged() {
  if (mouseButton == LEFT) {
    mandel.pan(pmouseX, pmouseY, mouseX, mouseY);
    mandel.dessiner();
  }
}

// right click : switching the fractal representation
void mousePressed() {
  if (mouseButton == RIGHT) {
    mandel.switchJulia(mouseX, mouseY);
  }
  mandel.dessiner();
}
