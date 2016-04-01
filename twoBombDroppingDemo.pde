import seltar.motion.*;

import processing.video.*;
Movie movie;


 float FR=240;
int num = 20;
int range = 10;
int sf=25;
PImage img2;
PImage imgbkMAP;
float[] bx = new float[num];
float[] by = new float[num]; 

PShape pot,pot2;
float i=0;
boolean fwdFlag=true ;

int numFrames = 46;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];

void setup()
{
  size(600, 800,P3D);
  
  
  pot = loadShape("Atomicbomb.obj");
  pot.scale(0.25);
  

  imgbkMAP=loadImage("NK.jpg");
  //img2 = loadImage("next.gif");
  imageMode(CENTER);
  frameRate(FR);  
  smooth();
 
  // Load and play the video in a loop
  movie = new Movie(this, "nk.mov");
  movie.loop();
 
 
 
}

void movieEvent(Movie m) {
  m.read();
}

void draw()
{
  
  
  
 background(imgbkMAP);
 //rect(0,0,250,250);

 //point(250, 250);
 lights();
  pot = loadShape("Atomicbomb.obj");
  pot.scale(0.25/(i+1));
  
  pushMatrix();
  translate(170, 320-i*2);
  rotateX(PI/2);
  rotateZ(i);
 
  tint(255, 255);
  shape(pot, 0, 0);  
  popMatrix();
   if ((0.25/(i+1)<0.01)&&(0.008<(0.25/(i+1))))
   {
     pushMatrix(); 
     blendMode(BLEND);  //REPLACE;BLEND;SUBTRACT;LIGHTEST;DARKEST;DIFFERENCE;EXCLUSION;MULTIPLY;SCREEN;
     tint(255, 200);
     image(movie, 170, 320-i*2,72,48);
     popMatrix();
   }
    
   
   
   
    
   
  if (i>20)
  {
   pot2 = loadShape("Atomicbomb.obj");
  pot2.scale(0.25/(i-20+1));
  pushMatrix();
  translate(170, 400-(i-20)*5); 
  
  
 
  rotateX(PI/2);
  rotateZ(i);
  
  shape(pot2, 0, 0);
  popMatrix();
   if ((0.25/((i-20)+1)<0.01)&&(0.008<(0.25/((i-20)+1))))
   {
     pushMatrix(); 
     blendMode(BLEND);  //REPLACE;BLEND;SUBTRACT;LIGHTEST;DARKEST;DIFFERENCE;EXCLUSION;MULTIPLY;SCREEN;
     tint(255, 200);
     image(movie, 170, 400-(i-20)*5,72,48);
     popMatrix();
   }
  
  
  
  // popMatrix();
   
  }
 
  i=i+0.2;




}