class Mandelbrot {
  
  Complexe zMin;
  Complexe zMax;

  int nMax; 

  boolean julia; // Mandelbrot or Julia ?
  Complexe juliaC; 

  PShader shader; // Shader <3

  Mandelbrot(float reMin, float imMin, float largeur, int nMax) {
    float reMax = reMin + largeur;
    float imMax = imMin + largeur * height / width;

    zMin = new Complexe(reMin, imMin);
    zMax = new Complexe(reMax, imMax);
    this.nMax = nMax;

    julia = false;
    juliaC = new Complexe();

    shader = loadShader("mandelbrot.GLSL.txt");
    shader.set("size", float(width), float(height));
    shader.set("nMax", nMax);
    setShaderZ();
    setShaderJulia();
  }

  void setShaderZ() {
    shader.set("zMin", zMin.re(), zMin.im());
    shader.set("zMax", zMax.re(), zMax.im());
  }

  void setShaderJulia() {
    shader.set("julia", julia);
    shader.set("juliaC", juliaC.re(), juliaC.im());
  }

  void dessiner() {
    shader(shader);
    noStroke();
    rect(0, 0, width, height);
  }

  // Pixel into complex 
  Complexe zPlan(int x, int y) {
    float re = map(x, 0, width, zMin.re(), zMax.re());
    float im = map(y, 0, height, zMax.im(), zMin.im());
    return new Complexe(re, im);
  }

  void zoom(int x, int y, float factor) {
    Complexe z = zPlan(x, y);
    zMin = z.plus(zMin.moins(z).div(factor));
    zMax = z.plus(zMax.moins(z).div(factor));
    setShaderZ();
  }

  void pan(int px, int py, int x, int y) {
    Complexe delta = zPlan(px, py).moins(zPlan(x, y));
    zMin = zMin.plus(delta);
    zMax = zMax.plus(delta);
    setShaderZ();
  }
  
  // Switch Julia -> Mandelbrot or MandelBrot -> Julia depending on the position of the mouse
  void switchJulia(int x, int y) {
    if (!julia) {
      juliaC = zPlan(x, y);
    }
    julia = !julia;
    setShaderJulia();
  }
}
