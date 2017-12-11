import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Sound for hit
Minim minim;
AudioPlayer player;

float x;
float y;
float dx = 1;
float dy = 1;

float accx = 0.5;
float accy = 0.8;

float bw = 150;
float bh = 30;
String bTxt = "START";
float dw = 150;
float dh = 30;
String dTxt = "RESTART"

float radEnemy = 30;

Boolean scene1 = true;
Boolean scene2 = false;
Boolean scene3 = false;
Boolean scene4 = false;

// parameters for robot
float rw = 45;
float rh = 153;

void setup() {
  size(600, 600);
  
  minim = new Minim(this);
  player = minim.loadFile("dishes-break-01.wav");

}

void draw() {
  background(255);

  if (scene2 == true) {
    // draw robot
    drawMycustomRobot(mouseX, mouseY, 52, 152, 219);
    
    x = x+accx*dx;
    y = y +accy*dy;

    if (x > width || x < 0)
    {
      accx = random(0.1, 5);
      dx = dx*-1;
    }

    if ( y > height || y < 0) {
      accy = random(0.1, 5);
      dy = dy*-1;
    }

   
    
    fill(0);
    noStroke();
    ellipse(x, y, radEnemy, radEnemy);

    // Check hit detection with robot and enemy ball
    if (mouseX + rw/2 > x- radEnemy/2 && mouseX - rw/2 < x + radEnemy/2
      && mouseY + rh/2> y - radEnemy/2 && mouseY - rh/2 < y + radEnemy/2) {
        scene3 = true;
        scene1 = false;
        scene2 = false;
        scene4 = false;
        
        player.rewind();
        player.play();
    }
  }

  if (scene1 == true) {
    startButton();
  }
  
  // Scene 3 content
  if(scene3 == true) {
    fill(255,0,0,150);
    rect(0,0,width,height); 
  }
  
  if(scene4 == true) {
    
    restartButton();
    
     scene1 = true;
     scene2 = false;
     scene3 = false;
     scene4 = false;
  
    
  }
  
}

void startButton() {
  pushMatrix();
  translate(width/2 - bw/2, height/2 - bh/2);
  fill(#2ECC71);


  noStroke();
  rect(0, 0, bw, bh);

  fill(255);
  text(bTxt, bw/2 - textWidth(bTxt)/2, 18 );
  popMatrix();
}

void restartButton() {
  pushMatrix();
  translate(width/2 - dw/2, height/2 - dh/2);
  fill(#2ECC71);


  noStroke();
  rect(0, 0, dw, dh);

  fill(255);
  text(dTxt, dw/2 - textWidth(dTxt)/2, 18 );
  popMatrix();
}

void mousePressed() {
  if (mouseX > width/2 - bw/2 && mouseX < width/2 - bw/2 + bw
    && mouseY > height/2 - bh/2 && mouseY < height/2 - bh/2 + bh) {
    scene1 = false;
    scene2 = true;
    scene3 = false;
    scene4 = false;
  }
  
  void mousePressed() {
  if (mouseX > width/2 - dw/2 && mouseX < width/2 - dw/2 + dw
    && mouseY > height/2 - dh/2 && mouseY < height/2 - dh/2 + dh) {
    scene1 = false;
    scene2 = false;
    scene3 = false;
    scene4 = true;
  }
  
}

void drawMycustomRobot(float xpos, float ypos, float r, float g, float b) {
  pushMatrix();

  //translate(mouseX,mouseY);
  translate(xpos - 50 + 25, ypos - 150 + 75);
  //start custom shape
  beginShape();
  vertex(110,180); //first vertex point of create
  vertex(210,180);
  vertex(210,250);
  vertex(110,250);
  endShape(CLOSE); // CLOSE shape stroke
  
  fill(#000000);

//start custom shape
  beginShape();
  vertex(120,190); //first vertex point of create
  vertex(150,190);
  vertex(150,200);
  vertex(170,200);
  vertex(170,190);
  vertex(200,190);
  vertex(200,220);
  vertex(180,220);
  vertex(180,230);
  vertex(170,230);
  vertex(170,240);
  vertex(150,240);
  vertex(150,230);
  vertex(140,230);
  vertex(140,220);
  vertex(120,220);
  endShape(CLOSE); // CLOSE shape stroke
  
  fill(255);
  
  //start custom shape
  beginShape();
  vertex(110,200); //first vertex point of create
  vertex(110,220);
  vertex(70,220);
  vertex(70,200);
  endShape(CLOSE); // CLOSE shape stroke
  

 //start custom shape
  beginShape();
  vertex(250,200); //first vertex point of create
  vertex(250,220);
  vertex(210,220);
  vertex(210,200);
  endShape(CLOSE); // CLOSE shape stroke
  
  fill(#000000);
  
  //start custom shape
  arc(50,200,80,80,0,PI,CLOSE);
  arc(270,200,80,80,0,PI,CLOSE);
  
  fill(#000000);
  
  //start custom shape
  beginShape();
  vertex(190,250); //first vertex point of create
  vertex(190,370);
  vertex(170,370);
  vertex(170,250);
  endShape(CLOSE); // CLOSE shape stroke
  
  //start custom shape
  beginShape();
  vertex(150,250); //first vertex point of create
  vertex(150,370);
  vertex(130,370);
  vertex(130,250);
  endShape(CLOSE); // CLOSE shape stroke
  
    //start custom shape
  arc(110,370,80,80,0,PI,CLOSE);
  arc(210,370,80,80,0,PI,CLOSE);
  
  //start custom shape
  beginShape();
  vertex(230,270); //first vertex point of create
  vertex(160,310);
  vertex(90,270);
  endShape(CLOSE); // CLOSE shape stroke
  
  fill(#19B42A);
  
  //start custom shape
  beginShape();
  vertex(170,160); //first vertex point of create
  vertex(170,180);
  vertex(150,180);
  vertex(150,160);
  endShape(CLOSE); // CLOSE shape stroke
  
  //start custom shape
  beginShape();
  vertex(250,40); //first vertex point of create
  vertex(250,160);
  vertex(70,160);
  vertex(70,40);
  endShape(CLOSE); // CLOSE shape stroke
  
  //start custom shape
  beginShape();
  vertex(230,50); //first vertex point of create
  vertex(230,70);
  vertex(190,70);
  vertex(190,50);
  endShape(CLOSE); // CLOSE shape stroke
  
  //start custom shape
  beginShape();
  vertex(130,50); //first vertex point of create
  vertex(130,70);
  vertex(90,70);
  vertex(90,50);
  endShape(CLOSE); // CLOSE shape stroke
  
  fill(#FF0000);
  
  //start custom shape
  beginShape();
  vertex(210,130); //first vertex point of create
  vertex(210,150);
  vertex(110,150);
  vertex(110,130);
  endShape(CLOSE); // CLOSE shape stroke
  popMatrix();
}