//Processing code for Contingencies_v1's real-time score.

//Declare Global Variables
PImage[] imgs = new PImage[18]; // Init array from images
PImage img; // current image
int curImg = 0, array_selector=580; //current image index, init red box position
float x, y; //Init x,y values of scrolling red bar 
float tick, tick1; //Float for moving the scrolling red bar across the screen
int secondValue, thirdValue, fourthValue, fifthValue, sixthValue, seventhValue, eighthValue, ninthValue, tenthValue, eleventhValue, twelvthValue, thirteenthValue,   fourteenthValue, fiftheenthValue, sixteenthValue=0; //Array from SUperCollider
float firstValue; //Audio clock from SuperCollider for accurate sync.
PFont f; //Font
String sc_address=""; //String containing WIFI address for SuperCollider connectivity

//Import OSC libraries
import oscP5.*; 
import netP5.*;

OscP5 oscP5; // object for OSC send and receive
NetAddress myRemoteLocation; // object for service address

void setup()
{
  //Screensize/Stroke Parameters
  size(1275,825);
  smooth(8);
  strokeWeight(4);
  stroke(255, 0, 0);

  //Load images into an array. Resize images to fit screen size.
  for(int i = 0; i < imgs.length; i ++){
  imgs[i] = loadImage("img"+(i)+".png");
  imgs[i].resize(imgs[i].width/4, imgs[i].height/4);
   }
  
  //Init first image
  img = imgs[curImg]; 
 
 
  //Starting point of scrolling red bar.
  x = 36; y = height;
  
  //Init font
  f = createFont("Arial",46,true);
  
  //Start OSC and listen port...
  oscP5 = new OscP5(this,4859); 
  
  //Set remote location to localhost SuperColider port
  myRemoteLocation = new NetAddress(sc_address,4859);
}

void draw()
{
  //Location of the red square depending on which formal module is taking place.
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
  
  //Draw image
  imageMode(CORNER); //Specify image placement at the corners
  background(0); //Background
  image(imgs[secondValue], 0, 0); //Draw image
  
  //Draw array at top of the screen
  stroke(255, 0, 0);  
  line(x,65,x, y);
  textFont(f,16);
  fill(255, 0, 0); 
  stroke(255, 0, 0);
  rect(array_selector, 3, 30, 30);  
  stroke(0);
  fill(0); 
  textSize(32);
  text(thirdValue + "  " + fourthValue + "  " + fifthValue + "  " + sixthValue + "  " + seventhValue + "  " + eighthValue + "  " + ninthValue + "  " + tenthValue + "  " + eleventhValue + "  " + twelvthValue+ "  " + thirteenthValue + "  " +  fourteenthValue  + "  " + fiftheenthValue ,width/2-50,30); 

}

void oscEvent(OscMessage theOscMessage) 
{  
  //Get values from SuperCollider
  
  // get the first value as an float, the rest as ints
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
    
  //Move scolling red bar 
  tick = (firstValue % 3600);
  tick1 = tick * 0.94;
  x = tick1;
  
  //Print array from SuperCollider: for debugging
  //println(firstValue+ "  " +secondValue+ "  " +thirdValue + "  " + fourthValue + "  " + fifthValue + "  " + sixthValue + "  " + seventhValue + "  " + eighthValue + "  " + ninthValue + "  " + tenthValue + "  " + eleventhValue + "  " + twelvthValue+ "  " + thirteenthValue + "  " +  fourteenthValue  + "  " + fiftheenthValue);
}