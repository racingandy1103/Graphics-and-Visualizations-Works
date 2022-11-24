PImage img;
Ship ship; 
Ship ship1;
Planet planet;
Window glass;
Window glass1;
Asteroid asteroid1;
Asteroid asteroid2;
Asteroid asteroid3;
// This variable if for moving the ufo up and down 
int ufo1 = 400; 
int ufo2 = 500;
// This variable is for making the bottom of ufo larger or smaller
float scale_ufo1 = 7;
float scale_ufo2 = 10;
// This variable is for moving the top of the ufo up and down
int top_of_ufo1 = ufo1 - 10;
int top_of_ufo2 = ufo2 - 15;
// This variable is for making top of ufo larger or smaller
float scale_top_ufo1 = 0.65;
float scale_top_ufo2 = 1;

float scale_planet = 40;

float scale_asteroid = 30;
void setup(){
  size(800,600,P3D);
  ship = new Ship(ufo1,scale_ufo1,0);
  ship1 = new Ship(ufo2,scale_ufo2,0);
  glass = new Window(top_of_ufo1,scale_top_ufo1,0);
  glass1 = new Window(top_of_ufo2,scale_top_ufo2,0);
  planet = new Planet(200,scale_planet,900);
  asteroid1 = new Asteroid(0, 400, 0., 1.*10, -.3*10, scale_asteroid);
  asteroid2 = new Asteroid(200, 300,0., .5*10, 0.7*10, scale_asteroid);
  asteroid3 = new Asteroid(100, 200, 0., -.8*10, 0.6*10, scale_asteroid);
  img = loadImage("space.jpg");
  surface.setSize(800,600);
  
}
void draw(){
  image(img,0,0);
  ship.display();
  ship1.display();
  glass.display();
  glass1.display();
  planet.display();
  planet.force();
  planet.pull();
  asteroid1.display();
  asteroid2.display();
  asteroid3.display();
}
