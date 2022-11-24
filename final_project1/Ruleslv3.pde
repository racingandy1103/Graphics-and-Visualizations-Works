class Ruleslv3{
  float circle_x, circle_y, radius; 
  float X1, Y1, X2, Y2, X3, Y3;
  Circles circles;
  int speed = 5;
  Pointer pointer = new Pointer(400,550,420,590,380,590);
  PImage heart1 = loadImage("heart.png");
  PImage heart2 = loadImage("heart.png");
  PImage heart3 = loadImage("heart.png");
  ArrayList<Circles> circlelist= new ArrayList<Circles>();
  float centerPoint_Tri_X; 
  float centerPoint_Tri_Y; 
  int count_y;
  int circle_num = 1;
  int heart_num = 3;
  int invincible_frame;
  boolean gameover = false;
  boolean paused = false;
  
  Ruleslv3(float circle_x, float circle_y, float r){
    this.circle_x = circle_x;
    this.circle_y = circle_y;
    radius = r;
    if(circle_y < 600){
      circlelist.add(new Circles(circle_x,circle_y,radius,speed));
      
    }
  }
  
 
  

  void display(){
   int radius_tri = 5;
   pushMatrix();
   fill(234,110,85);
   textSize(20);
   text("Goal: achieve 1000 points!!!",20,80);
   text("Use up, down, left, right keys to avoid falling squares",20,50);
   textSize(25);
   fill(0);
   text("Points:"+frameCount,630,100);
   popMatrix();
    
  if(frameCount % 15 == 0){
      circle_num += 1;
      float pos = random(10,750);
      circlelist.add(new Circles(pos,0,random(25,100),speed));
   }
  
  for(Circles i: circlelist){
     i.display();
  }
  print('\n');
  
  
    if(heart_num == 3){
      image(heart1,600,25,width/14, height/14);
      image(heart2,650,25,width/14, height/14);
      image(heart3,700,25,width/14, height/14);
    }else if(heart_num == 2){
      image(heart1,600,25,width/14, height/14);
      image(heart2,650,25,width/14, height/14);
      
    }else if(heart_num == 1){
      image(heart1,600,25,width/14, height/14);
    }else if(heart_num == 0){
      background(100);
      textSize(64);
      fill(255,157,157);
      text("Tap Space Bar to Restart", 40, 250);
      text("Game Over", 40, 120); 
      gameover = true;
      noLoop();
      
    }
  checkCircle(radius_tri); 
  
  pointer.display();
       
   
  }
 
  
  
  
  void keyPressed() {
   pointer.keyPressed();
   if(gameover){
     if(key == ' '){
        frameCount = -1;
        heart_num = 3;
        gameover = false;
        loop();
        frameCount = -1;
      }
   }else{
     if(paused == false){
       if(key == ' '){
          fill(48,111,152,100);
          rect(20,40,600,400);
          textSize(64);
          fill(255,0,0);
          text("Pause", 40, 120); 
          textSize(30);
          fill(0);
          text("Press R key to restart", 40, 250);
          text("Press Space key to continue", 40, 300);
          text("Press T key to return to title page", 40, 350);
          paused = true;
          noLoop(); 
        }
       
     }else{
       if(key ==' '){
         loop(); 
         paused = false;
       }
       if(key == 'r'){
        frameCount = -1;
        heart_num = 3;
        gameover = false;
        paused = false;
        loop();
        frameCount = -1;
      }
      if(key == 't'){
        loop();
        levelnum = 0;
        mainmenu = true;
        paused = false;
      }
     }
   }
     
   
  }
  
  boolean checkCircle(float radius_tri){
    
    if(frameCount > invincible_frame && frameCount <= invincible_frame + 40){
      return false;
    }
    for(Circles i: circlelist){
      if(dist(pointer.centerPoint_Tri_X,pointer.centerPoint_Tri_Y,circlelist.get(0).x1,circlelist.get(0).y1) < circlelist.get(0).radius-20){
        invincible_frame = frameCount;
        heart_num -= 1;
        return true;
    }
    
    
  }
    if(circlelist.get(0).y1 > 600){
       circlelist.remove(0);
     }
      return false;
  }
  
  }
  
 
  
  
  

 
