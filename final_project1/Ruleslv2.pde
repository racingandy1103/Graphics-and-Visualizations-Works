class Ruleslv2{
  float square_x, square_y, radius; 
  float X1, Y1, X2, Y2, X3, Y3;
  Squares squares;
  int speed = 5;
  Pointer pointer1 = new Pointer(400,550,420,590,380,590);
  PImage heart1 = loadImage("heart.png");
  PImage heart2 = loadImage("heart.png");
  PImage heart3 = loadImage("heart.png");
  ArrayList<Squares> squarelist= new ArrayList<Squares>();
  float centerPoint_Tri_X; 
  float centerPoint_Tri_Y; 
  int count_y;
  int square_num = 1;
  int heart_num = 3;
  int invincible_frame;
  boolean gameover = false;
  boolean paused = false;
  
  Ruleslv2(float square_x, float square_y, float r){
    this.square_x = square_x;
    this.square_y = square_y;
    radius = r;
    if(square_y < 600){
      squarelist.add(new Squares(square_x,square_y,radius,speed));
      
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
    
  if(frameCount % 30 == 0){
      square_num += 1;
      float pos = random(10,750);
      squarelist.add(new Squares(pos,0,random(25,100),speed));
   }
  
  for(Squares i: squarelist){
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
  checksquare(radius_tri); 
  
  pointer1.display();
  
       
   
  }
 
  
  
  
 void keyPressed() {
   pointer1.keyPressed();
   
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
        loop();
        frameCount = -1;
      }
      if(key == 't'){
        loop();
        levelnum = 0;
      }
     }
   }
     
   
  }
  
  boolean checksquare(float radius_tri){
    
    if(frameCount > invincible_frame && frameCount <= invincible_frame + 40){
      return false;
    }
    for(Squares i: squarelist){
      if(((pointer1.X2 < i.x1+radius && pointer1.X2 > i.x1) || (pointer1.X3 > i.x1 && pointer1.X3 < i.x1+radius)) && ((pointer1.Y1 < i.y1+radius && pointer1.Y1 > i.y1) || (pointer1.Y2 < i.y1+radius && pointer1.Y2 > i.y1))){
        invincible_frame = frameCount;
        heart_num -= 1;
        return true;
    }
    
    
  }
    if(squarelist.get(0).y1 > 600){
       squarelist.remove(0);
     }
      return false;
  }
  
  }
  
 
  
  
  
