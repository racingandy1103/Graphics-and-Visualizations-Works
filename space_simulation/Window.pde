class Window{
  int x = 0;
  int y;
  float scale = 0;
  int direction;
  // My forces 
  float vel = 0;
  float friction = 0.65;
  float acc = 2;
  float drag = 0.5;
  float targetX = 600;

  Window(int y, float scale, int direction){
    this.y = y;
    this.scale = scale;
    this.direction = direction;
   
  }

  void display(){
   if (direction < 900){
      pushMatrix();
      translate(x,y);
      scale(scale);
      lights();
      noStroke();
      fill(174,204,240);
      sphere(25);
      if (x > 975){
        x = 0;
      }
      if ( x > 400){
        vel *= friction;
      }
      popMatrix();
      vel += acc;
      x += vel;
     
      
      
    }
  

    }
  
  
  
  
  
  
}
