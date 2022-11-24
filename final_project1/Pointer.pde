class Pointer{
  float X1, Y1, X2, Y2, X3, Y3;
  float centerPoint_Tri_X;
  float centerPoint_Tri_Y;
  
  Pointer(float X1, float Y1, float X2, float Y2, float X3, float Y3){
    this.X1 = X1;
    this.Y1 = Y1;
    this.X2 = X2;
    this.Y2 = Y2;
    this.X3 = X3;
    this.Y3 = Y3;
    centerPoint_Tri_X = (X1+X2+X3)/3;
    centerPoint_Tri_Y = (Y1+Y2+Y3)/3;
    
  }
  
void display(){
  fill(200,0,0);
  noStroke();
  triangle(X1,Y1,X2,Y2,X3,Y3);
  print(Y1,Y2,Y3);
 
  
}


void keyPressed() {
  if (keyCode == UP) {
    
    if (Y3 > 400 && Y3 < 600){
      Y1 = Y1 - 25;
      Y2 = Y2 - 25;
      Y3 = Y3 - 25;
      print(Y1,Y2,Y3);
    }
  }
  else if (keyCode == DOWN) {
    if (Y3 < 590){
      Y1 = Y1 + 25;
      Y2 = Y2 + 25;
      Y3 = Y3 + 25;
    }
  }
  else if (keyCode == RIGHT) {
    if (X2 < 790){
      X1 = X1 + 25;
      X2 = X2 + 25;
      X3 = X3 + 25;
    }
  }
  else if (keyCode == LEFT) {
    if (X3 > 10 ){
      X1 = X1 - 25;
      X2 = X2 - 25;
      X3 = X3 - 25;
    }
    }
  centerPoint_Tri_X = (X1+X2+X3)/3;
  centerPoint_Tri_Y = (Y1+Y2+Y3)/3;
  }

}
  
  
  
  
  
