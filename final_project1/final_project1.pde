Rules rules; 
Ruleslv2 ruleslv2; 
Ruleslv3 ruleslv3; 
boolean paused = false;
boolean mainmenu = true;
float circle_x, circle_y, radius; 
int levelnum = 0;
Circles circles;
ArrayList<Circles> circlelist= new ArrayList<Circles>();
int speed = 5;

void setup(){
  size(800,600);
  rules = new Rules(200,0,50);
  ruleslv2 = new Ruleslv2(200,0,50);
  ruleslv3 = new Ruleslv3(200,0,50);
}

void draw(){
  background(100);
  
  if(levelnum == 3){
    rules.display();
  }
  else if(levelnum == 2){
    rules.display();
  }
  else if(levelnum == 1){
   rules.display();
  }else if(levelnum == 0){
    textSize(60);
    if(circle_y < 600){
      circlelist.add(new Circles(circle_x,circle_y,radius,speed));
      
    }
    if(frameCount % 30 == 0){
      
      float pos = random(10,750);
      circlelist.add(new Circles(pos,0,random(25,100),speed));
   }
  
    for(Circles i: circlelist){
     i.display();
    }
    fill(43,107,170,100);
    rect(140,250,500,250);
    fill(250,182,93);
    text("Tridodge",250,150);
    textSize(30);
    text("Press 1 key to start level 1",200,300);
    text("Press 2 key to start level 2",200,350);
    text("Press 3 key to start level 3",200,400);
    text("Press L key to see leaderboard",170,450);
    fill(200,0,0);
    triangle(400,550,420,590,380,590);
  }

}



void keyPressed(){
  rules.keyPressed();
  if(key == '1' && mainmenu){
    mainmenu = false;
    frameCount = -1;
    levelnum = 1;
  }
  if(key == '2' && mainmenu){
    mainmenu = false;
    frameCount = -1;
    levelnum = 2;
  }
  if(key == '3' && mainmenu){
    mainmenu = false;
    frameCount = -1;
    levelnum = 3;
  }
}
