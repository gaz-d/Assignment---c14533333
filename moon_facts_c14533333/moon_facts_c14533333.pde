int cols , rows;
int w = 1250;//h & w set to these values so the land will fill the view of the screen
int h = 600;
int scale = 20;
int value = 0;

float moving = 0;

PImage surface;
PImage stars;
PImage earth;
PImage red_planet;
PImage j_text;
PImage blue_planet ;

PShape neptune;
PShape mars;
PShape globe;
PShape moon;
PShape jupiter;

PFont font;



float[][] land ;

void setup(){
  size(600,600, P3D );
  surface = loadImage("surface1.jpg");
  stars = loadImage("stars.jpg");
  cols = w/scale;
  rows = h/scale;
  land = new float[cols][rows]; //<>//
  frameRate(55);//used to slow the speed down and make moving animation look more realisic
   println( "Press 1st letter of planet for info");
   println( "Click mouse for a moon fact");
  font = createFont("YuGo-Medium", 32);
  
  textFont(font, 32);

}

  void draw_jupiter(){
     
   pushMatrix();
   translate(300,125,100);
   lights();

        noStroke();

   j_text = loadImage("Jupiter.jpg");
    
    jupiter = createShape(SPHERE, 70);
    jupiter.setTexture(j_text);//using dot syntax to make the sphere resemble the earth 
    
    
    

    shape(jupiter);
       
    popMatrix();
    //strokeWeight(.1);//set the stroke weight to .1
    
   }//end draw jupiter
   
   
   
 void  draw_neptune(){
     
     pushMatrix();
   translate(440,125,100);
   lights();

        noStroke();

    blue_planet = loadImage("neptune.jpg");
    
    neptune = createShape(SPHERE, 45);
    neptune.setTexture(blue_planet);//using dot syntax to make the sphere resemble the earth 
    
    
    

    shape(neptune);
       
    popMatrix();
    //strokeWeight(.1);//set the stroke weight to .1
   }//end draw neptune 



   void draw_mars(){
     
   pushMatrix();
   translate(200,125,100);
   lights();

        noStroke();

    red_planet = loadImage("mars texture.jpg");
    
    mars = createShape(SPHERE, 22);
    mars.setTexture(red_planet);//using dot syntax to make the sphere resemble the earth 
    
    
    

    shape(mars);
       
    popMatrix();
    //strokeWeight(.1);//set the stroke weight to .1
    
   }
     

void draw_globe(){
  
  

   pushMatrix();
   translate(130,125,100);
   lights();
    earth = loadImage("Earth.jpg");
    
    globe = createShape(SPHERE, 30);
    globe.setTexture(earth);//using dot syntax to make the sphere resemble the earth 
    
    

    shape(globe);
       
    popMatrix();
    //strokeWeight(.1);//set the stroke weight to .1
    
    
  
}


 void draw_moon(){
   
  stroke(255,255,255,255);
  strokeWeight(.25);//set the stroke weight to .25
  noFill();


    moving -=.09;
    
    float yoffsett = moving;
     for(int y = 0; y < rows; y++ ){
        float xoffsett = 0;
          for(int x = 0; x < cols; x++ ){
            land[x][y] = map(noise(xoffsett,yoffsett),0,1,-75,75);
            xoffsett+=.13;
          
          }
          yoffsett+=.13;
    }//end for loops to generate random 'Z' values to be stored in land array
  
  
  
  
  translate(width/2,height/2);
  
  rotateX(PI/3);
  //rotate the grid flat as if you are flying over it if previous line is not 
  //executed then it wwill not be seen as everything is drawn in relation to the 
  //top left.
  
  translate(-w/2,-h/2);
  //this re centers the grid because first translate is not enough
  
  
  
  for(int y = 0; y < rows - 1; y++ ){
   
    beginShape(TRIANGLE_STRIP) ;
      
    texture(surface);
    for(int x = 0; x < cols ; x++ ){
      
      vertex((x+1)*scale, (y+1)*scale,land[x][y]);      
      
      vertex(x*scale, (y)*scale,land[x][y+1]);/* makes its so the the vertices are drawn in triangle
                                  shapes instead of just on a singular line    */ 
                                }


    endShape();


  }//end vertices loop
 }//end draw moon function

void draw() {
  background(0);
  image(stars, 0, -1058,width,height*2);

  
            draw_globe();
            draw_mars();
            draw_jupiter();
            draw_neptune();
            
      
          
            
             
             
  if ((keyPressed == true) && ((key == 'e') || (key == 'E'))) 
  {
   textAlign(CENTER, BOTTOM);
    fill(255);
    text( " Earth is 384,400 km away ( 3 days ) ", 300,200);
  }
  
  
   if ((keyPressed == true) && ((key == 'm') || (key == 'M'))) 
  {
    textAlign(CENTER, BOTTOM);
    fill(255);
    text("Mars is 77.79 million km  away( 150 days ) ",300,200);
  }
  
  
  
   if ((keyPressed == true) && ((key == 'j') || (key == 'J'))) 
  {
    textAlign(CENTER, BOTTOM);
    fill(255);
    text( " Jupiter is 587.41056 million km away ( 6 years ) ",300,200);
  }
  
     if ((keyPressed == true) && ((key == 'n') || (key == 'N'))) 
  {
    textAlign(CENTER, BOTTOM);
    fill(255);
    text( "Neptune is 4.3 billion km away (12 years)",300,200);
  }
     
                        draw_moon();


}//end draw


void mousePressed(){
  
      if (value == 0){
        
        
        println("FACT 1: Only 59% of the moon's surface is visible from earth");

        value++;
        }
        else if(value ==1) {

              println("FACT 2: The surface area of the moon is 14,658,000 square miles or 9.4 billion acres.");
              value++;
              
          }
            else if(value ==2) {
              println("FACT 3: The moon rotates at 10 miles per hour compared to the earth's rotation of 1000 miles per hour.");
              value++;
             
       }
     
                else if(value ==3) {
                  println("FACT 4:The moon's diameter is about 1/4 the diameter of the Earth. About 49 moons would fit inside the Earth.");
                  value++;
                 
           }
         
   
}//end mouse pressed function