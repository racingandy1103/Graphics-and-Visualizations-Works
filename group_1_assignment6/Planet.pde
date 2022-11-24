class Planet{
  
  PShape planet;
  PShape moon;
  int x = 0;
  int y = 0;
  float r = 0;
  float moon_r;
  float force = 0.2;
  float scale;
  float planetscale;
  int direction;
  boolean faster = false;
  boolean smaller = true;
  
  float moonsize;
  
  Planet(int y, float scale, int direction){
   planet = loadShape("main_planet.obj");
   moon = loadShape("moon.obj");
   this.y = y;
   this.scale = scale;
   this.direction = direction;
   planetscale = scale + 25;
   moonsize = planetscale;
  }
 
  void display(){
    
    if (direction < 900){
      push();
      translate(x,y);
      push();
      scale(scale);
      noStroke();
      rotateY(moon_r);
      shape(moon,0,0,moon.width,moon.height);
      pop();
      scale(planetscale);
      directionalLight(252, 198, 0, -1,0,0);
      noStroke();
      rotateY(r);
      planet.setFill(color(157, 223, 255));
      shape(planet,0.3,-0.1,planet.width, planet.height);
      
      
      if (x == 900){
        x = 0;
      }
      pop();
      x += 0.005;
      r += 0.01;
      moon_r += force;
    }
    else{
      push();
      translate(x,y);
      push();
      scale(scale);
      noStroke();
      rotateY(moon_r);
      shape(moon,0,0,moon.width,moon.height);
      pop();
      scale(planetscale);
      directionalLight(252, 198, 0, -1,0,0);
      noStroke();
      rotateY(r);
      planet.setFill(color(157, 223,  255));
      shape(planet,0.3,-0.1,planet.width, planet.height);
      if (x == 0){
        x = 900;
      }
      pop();
      x -= 0.005;
      r -= 0.01;
      moon_r -= force;
    }
      
  }
  
  void force(){
    
    if(faster){
      force += 0.0009;
      
      if(force >=  0.5){
        faster = false;
     
      }
    }else{
      force -= 0.0009;
      if(force <= 0.005 ){
        faster = true;
      }
    }
  }
  
  void pull(){
    
    if(smaller){
      scale -= 0.025;
      print(scale + "\n");
      if(scale <= 20){
        smaller = false;
      }
    }else{
      scale += 0.025;
      if(scale >= moonsize){
        smaller = true;
      }
    }
    
  }
}
