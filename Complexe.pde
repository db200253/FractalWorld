class Complexe {  // Simple implementation of the complex world, it will help us 
  
  private float a;
  private float b;
  
  Complexe(float a, float b){
    this.a = a;
    this.b = b;
  }
  Complexe(float a){
    this.a = a;
    this.b = 0;
  }
  Complexe(){
    this.a = 0;
    this.b = 0;
  }
  Complexe(Complexe that){
    this.a = that.a;
    this.b = that.b;
  }
  
  float re(){
    return a;
  }
  
  float im(){
    return b;
  }
  
  String toString() {
    String r = "";
    
    if (a != 0 || b==0){
      r += a;
    }
    if (b != 0){
      if (b < 0){
        r += "-";
      } else if (a !=0){
        r += "+";
      } 
      if(abs(b) > 1){
        r += abs(b);
      }
      
      r += "i";
    }
    
    return r;
  }
  
  boolean egal(Complexe z){
    return a == z.a && b == z.b;
  }
  
  boolean egal(float c){
    return a == c && b == 0;
  }
  
  Complexe plus(Complexe z) {
    return new Complexe(a + z.a, b + z.b);
  }
  
  Complexe plus (float c){
    return new Complexe(a + c, b);
  }
  
  Complexe moins(Complexe z){
    return new Complexe(a - z.a, b - z.b);
  }
  
  Complexe moins(float c){
    return new Complexe(a - c, b);
  }
  
  Complexe multi(Complexe z){
    return new Complexe(a * z.a - b * z.b, a * z.b + b * z.a);
  }
  
  Complexe multi(float c){
    return new Complexe(a * c, b * c);
  }
  
  Complexe conj(){
    return new Complexe(a, -b);
  }
  
  float mod(){
    return sqrt(a*a + b*b);
  }
  
  float mod2(){
    return a*a + b*b;
  }
  
  Complexe div(float c){
    return new Complexe(a/c, b/c);
  }
  
  Complexe absolue(){
    if (a < 0){
      a = -a;
    } else if (b < 0){
      b = -b;
    }
    
    return new Complexe(a, b);
  }
}
