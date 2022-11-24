class Squares{
  float x1, y1, radius;
  int speed;
  PShape squares; 
  color[] colorList = {color(23,139,252),color(252,150,23),color(252,23,242),color(26,252,23),
                      color(164,23,252)};

  
  Squares(float x1, float y1, float r, int speed){
    fill(colorList[int(random(5))]);
    squares = createShape(RECT,0,0,r,r);
    this.x1 = x1;
    this.y1 = y1;
    radius = r; 
    this.speed = speed;
  
    
  }
  
  float moveX, moveY;
  void display(){
    pushMatrix();
    translate(x1,y1);
    shape(squares);
    popMatrix();
    y1 += speed;
  }
  
 
  
  
  
  
  
}
