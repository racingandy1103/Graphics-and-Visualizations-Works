class Ship{
  PShape ship;
  int x = 0;
  int y = 0;
  float r = 0;
  float x2 = 0;
  float vel = 0;
  float friction = 0.65;
  float acc = 2;
  float scale = 0;
  int direction;
  
  Ship(int y, float scale, int direction){
   ship = loadShape("ufo.obj");
   this.y = y;
   this.scale = scale;
   this.direction = direction;
  }
  
  
 
  void display(){
    if (direction < 900){
      pushMatrix();
      translate(x,y);
      scale(scale);
      rotateY(r);
      lights();
      noStroke();
      shape(ship,0,0,ship.width,ship.height);
      if (x > 975){
        x = 0;
      }
      if ( x > 400){
        vel *= friction;
      }
      popMatrix();
      vel += acc;
      x += vel;
      r += 0.05;
      
    }
    
      
  }
}
  
