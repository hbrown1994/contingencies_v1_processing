// 0 = 36
// 00:05 = 84
// distance between 5 second chucks in pixels = 48
// 1 second = 9.6

//make if stateents to ove red square with the form

PImage[] imgs = new PImage[18]; // loaded images
PImage img;                    // current image
int curImg = 0, array_selector=580;  
float x, y; 
float tick, tick1;
int secondValue, thirdValue, fourthValue, fifthValue, sixthValue, seventhValue, eighthValue, ninthValue, tenthValue, eleventhValue, twelvthValue, thirteenthValue,   fourteenthValue, fiftheenthValue, sixteenthValue=0;
float firstValue;
PFont f;

import oscP5.*;
import netP5.*;

OscP5 oscP5;                 // objet for OSC send and receive
NetAddress myRemoteLocation;  // objet for service address


void setup()
{
  
  size(1275,825);
  smooth(8);
  strokeWeight(4);
  stroke(255, 0, 0);

   for(int i = 0; i < imgs.length; i ++){
    imgs[i] = loadImage("img"+(i)+".png");
    imgs[i].resize(imgs[i].width/4, imgs[i].height/4);
  }
  
  img = imgs[curImg];
  

  x = 36; y = height;   // start at left, center
  
  f = createFont("Arial",46,true);
  
  oscP5 = new OscP5(this,4859); // start OSC and listen port ...
  // set remote location to localhost SuperColider port
  myRemoteLocation = new NetAddress("",4859);
}

void draw()
{
  
  if (sixteenthValue == -1) {
    array_selector=580;
  }
  if (sixteenthValue == 0) {
    array_selector=580;
  }
  
  if (sixteenthValue == 1) {
    array_selector=616;
  }
  
  if (sixteenthValue == 2) {
    array_selector=651;
  }
  
  if (sixteenthValue == 3) {
    array_selector=687;
  }
  
  if (sixteenthValue == 4) {
    array_selector=722;
  }
  
  if (sixteenthValue == 5) {
    array_selector=758;
  }
  
  if (sixteenthValue == 6) {
    array_selector=793;
  }
  
  if (sixteenthValue == 7) {
    array_selector=829;
  }
  
   if (sixteenthValue == 8) {
    array_selector=864;
  }
  
  if (sixteenthValue == 9) {
    array_selector=900;
  }
  
  if (sixteenthValue == 10) {
    array_selector=936;
  }
  
  if (sixteenthValue == 11) {
    array_selector=971;
  }
  
  if (sixteenthValue == 12) {
    array_selector=1006;
  }
  
  

  imageMode(CORNER); // specify it at the corners, easier for backgrounds
  background(0);
  image(imgs[secondValue], 0, 0);
  stroke(255, 0, 0);
  line(x,65,x, y);
  textFont(f,16);
  fill(255, 0, 0); 
  stroke(255, 0, 0);// STEP 3 Specify font to be used
  rect(array_selector, 3, 30, 30);  
  stroke(0);
  fill(0);    // STEP 4 Specify font color 
  textSize(32);
  text(thirdValue + "  " + fourthValue + "  " + fifthValue + "  " + sixthValue + "  " + seventhValue + "  " + eighthValue + "  " + ninthValue + "  " + tenthValue + "  " + eleventhValue + "  " + twelvthValue+ "  " + thirteenthValue + "  " +  fourteenthValue  + "  " + fiftheenthValue ,width/2-50,30); 


   // take one step to the right

}

void oscEvent(OscMessage theOscMessage) 
{  
  // get the first value as an integer
  firstValue = theOscMessage.get(0).floatValue();
  secondValue = theOscMessage.get(1).intValue();
  thirdValue = theOscMessage.get(2).intValue();
  fourthValue = theOscMessage.get(3).intValue();
  fifthValue = theOscMessage.get(4).intValue();
  sixthValue = theOscMessage.get(5).intValue();
  seventhValue = theOscMessage.get(6).intValue();
  eighthValue = theOscMessage.get(7).intValue();
  ninthValue = theOscMessage.get(8).intValue();
  tenthValue = theOscMessage.get(9).intValue();
  eleventhValue = theOscMessage.get(10).intValue();
  twelvthValue = theOscMessage.get(11).intValue();
  thirteenthValue = theOscMessage.get(12).intValue();
  fourteenthValue = theOscMessage.get(13).intValue();
  fiftheenthValue = theOscMessage.get(14).intValue();
  sixteenthValue = theOscMessage.get(15).intValue();

 
   
  
  println(firstValue+ "  " +secondValue+ "  " +thirdValue + "  " + fourthValue + "  " + fifthValue + "  " + sixthValue + "  " + seventhValue + "  " + eighthValue + "  " + ninthValue + "  " + tenthValue + "  " + eleventhValue + "  " + twelvthValue+ "  " + thirteenthValue + "  " +  fourteenthValue  + "  " + fiftheenthValue);
  tick = (firstValue % 3600);
  tick1 = tick * 0.94;

  x = tick1;
   // STEP 5 Display Text
  
}
