class Asteroid{
  PShape asteroid;
  int x = 0;
  int y = 0;
  float r = 0;
  float scale = 0;
  float velx, vely, accelx, accely;
  float xorig, yorig, rorig, velxorig, velyorig;

  float forcex, forcey, mass;
  
  
  Asteroid(int x, int y, float r, float velx, float vely, float scale){
    this.x = x;
    this.y = y;
    this.r = r;
    this.velx = velx;
    this.vely = vely;
    this.scale = scale;
    xorig = x;
    yorig = y;
    rorig = r;
    velxorig = velx;
    velyorig = vely;

    this.forcex = 0.5f;
    this.forcey = 0.1f;

    this.mass = 1.0f;


    asteroid = loadShape("asteroid.obj");
    this.scale = scale;
  }
 
  void display(){
    //if (x<0){
    //  x+=800;
    //}
    //if (x>800){
    //  x-=800;
    //}
    
    //if (y<0){
    //  y+=600;
    //}
    //if (y>600){
    //  y-=600;
    //}
    
    if (x<0 || x>800){
      this.velx*=-1;
    }
    if (y<0 || y>600){
      this.vely*=-1;
    }
    
    if (x < 900){
      pushMatrix();
      translate(x,y);
      scale(scale);
      lights();
      rotateY(r);
      noStroke();
      shape(asteroid,0,0,asteroid.width,asteroid.height);
      
      
      if (x == 900){
        x = 0;
      }
      
      //this.forcex = (float) Math.random()-0.5;
      //this.forcey = (float) Math.random()-0.5;

      
      
      
      popMatrix();
      this.velx += this.forcex/this.mass;
      x += this.velx;
      
      this.vely += this.forcey/this.mass;
      y += this.vely;
      // x += 0.5;
      r -= 0.2;
    }
    
    
    else{
      pushMatrix();
      translate(x,y);
      scale(scale);
      lights();
      rotateY(r);
      noStroke();
      shape(asteroid,0,0,asteroid.width,asteroid.height);
      if (x == 0){
        x = 900;
      }
      popMatrix();
      x -= 2;
      r += 0.1;
    }
      
      
    
  }
}
