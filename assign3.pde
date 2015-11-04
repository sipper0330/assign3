final int GAME_START=0;
final int GAME_PLAYING=1;
final int GAME_OVER=2;
final int FORMATION=0;
final int FORMATION_A=1;
final int FORMATION_B=2;
final int GAME_OVERFORMATION_B=2;

int gameState,formation;

PImage resA,resB,star,life,start1,start2,bg1,bg2,end1,end2;
int bg2X,bg1X,enemyX,enemyY,treasureX,treasureY,enemyXx,enemyYy,enemy,
spacing=3,enemyW=61,fighterW=51,treasureW=41,enemyA=0,
fighterX=640-fighterW,fighterY=480/2, speed=3;
float MaxHp=215,hp=215;
boolean upPressed=false,downPressed=false,rightPressed=false,leftPressed=false;


void setup(){
size(640,480);
gameState=GAME_START;
formation=FORMATION;
start1=loadImage("img/start1.png");
start2=loadImage("img/start2.png");
end1=loadImage("img/end1.png");
end2=loadImage("img/end2.png");
resA=loadImage("img/enemy.png");
resB=loadImage("img/fighter.png");
star=loadImage("img/treasure.png");
life=loadImage("img/hp.png");
bg1=loadImage("img/bg1.png");
bg2=loadImage("img/bg2.png");
colorMode(RGB);
color(234,34,34);

treasureX=floor(random(10,600));
treasureY=floor(random(10,308));
enemyY=floor(random(10,308));
enemyYy=floor(random(10,308));
enemyX=-(enemyW+spacing)*5;
enemyXx=0;
bg1X=641;
bg2X=0;
}

void draw(){
  //GAME_START
  switch(gameState){
    case GAME_START:
    image(start2,0,0);
    
    if(mouseX>width/3 && mouseY>380 && mouseX<width*2/3 && mouseY<410){
    image(start1,0,0);
    if(mousePressed){
    gameState=GAME_PLAYING;
    hp=hp-(MaxHp-9)*4/5;
    }
    }
  break;
  //GAME_PLAYING
  case GAME_PLAYING:
  image(bg1,bg1X-641,0);
  image(bg2,bg2X-641,0);
  enemyX+=3;
  switch(formation){
    case FORMATION:
  for(int enemy=0; enemy<5;enemy++){
  enemyXx=enemyX+(enemyW+spacing)*enemy;  
  image(resA,enemyXx,enemyYy);}
  if(enemyX>width){enemyX=0-(enemyW+spacing)*5;
  enemyY=floor(random(10,400-5*(enemyW)));
     formation=FORMATION_A;
     
     }
  break;

  case FORMATION_A:
  
  for(int enemyA=0; enemyA<5;enemyA++){
  enemyXx=enemyX+(enemyW-spacing)*enemyA;
  enemyYy=enemyY+(enemyW-20)*enemyA; 
  image(resA,enemyXx,enemyYy);}
  if(enemyX>width){enemyX=0-(enemyW+spacing)*5;
  enemyY=floor(random(80,400-3*(enemyW)));
     formation=FORMATION_B;
     
  }
  break;  
  case FORMATION_B:
  
  for(int enemyB=0; enemyB<3;enemyB++){
    for(int enemyC=0; enemyC<3;enemyC++){
      for(int enemyD=0; enemyD<3;enemyD++){
        for(int enemyE=0; enemyE<3;enemyE++){
  enemyXx=enemyX+(enemyW-spacing)*enemyB;
  enemyYy=enemyY+(enemyW-20)*enemyB; 
  int enemyXA=enemyX+(enemyW-spacing)*enemyC;
  int enemyYA=enemyY-(enemyW-20)*enemyC; 
  int enemyXB=enemyX-(enemyW-spacing)*enemyD+4*(enemyW-spacing);
  int enemyYB=enemyY-(enemyW-20)*enemyD; 
  int enemyXC=enemyX-(enemyW-spacing)*enemyE+4*(enemyW-spacing);
  int enemyYC=enemyY+(enemyW-20)*enemyE; 
  image(resA,enemyXx,enemyYy);
  image(resA,enemyXC,enemyYC);
  image(resA,enemyXB,enemyYB);
  image(resA,enemyXA,enemyYA);}
  if(enemyX>width+(enemyW-spacing)*4){enemyX=0-(enemyW+spacing)*5;
    enemyY=floor(random(80,height-80));
     formation=FORMATION;
   
  }
  }
  }
  }
  break;  
  } 
  image(resB,fighterX,fighterY);
     if(upPressed){
       fighterY-=speed;
    }
    if(downPressed){
      fighterY+=speed;
    }
    if(rightPressed){
       fighterX+=speed;
    }
    if(leftPressed){
       fighterX-=speed;
    }
    if(fighterX<0){fighterX=0;}
    if(fighterX>640-fighterW){fighterX=640-fighterW;}
    if(fighterY<0){fighterY=0;}
    if(fighterY>480-fighterW){fighterY=480-fighterW;}
    

    
    if(fighterY>treasureY && fighterY<treasureY+treasureW &&
    fighterX>treasureX && fighterX<treasureX+treasureW ){
      if (hp<MaxHp-9){hp=hp+(MaxHp-9)/10;
      treasureX=floor(random(10,600));
      treasureY=floor(random(10,308));}
    else{treasureX=floor(random(10,600));
         treasureY=floor(random(10,308));}
    }
    if(fighterY+fighterW>treasureY && fighterY+fighterW<treasureY+treasureW &&
    fighterX+fighterW>treasureX && fighterX+fighterW<treasureX+treasureW ){
      if (hp<MaxHp-9){hp=hp+(MaxHp-9)/10;
      treasureX=floor(random(10,600));
      treasureY=floor(random(10,308));}
    else{treasureX=floor(random(10,600));
         treasureY=floor(random(10,308));}
    }
    if(fighterY+fighterW>treasureY && fighterY+fighterW<treasureY+treasureW &&
    fighterX>treasureX && fighterX<treasureX+treasureW ){
      if (hp<MaxHp-9){hp=hp+(MaxHp-9)/10;
      treasureX=floor(random(10,600));
      treasureY=floor(random(10,308));}
    else{treasureX=floor(random(10,600));
         treasureY=floor(random(10,308));}
    }
    if(fighterY>treasureY && fighterY<treasureY+treasureW &&
    fighterX+fighterW>treasureX && fighterX+fighterW<treasureX+treasureW ){
     if (hp<MaxHp-9){hp=hp+(MaxHp-9)/10;
      treasureX=floor(random(10,600));
      treasureY=floor(random(10,308));}
    else{treasureX=floor(random(10,600));
         treasureY=floor(random(10,308));}
    }
    //5
    if(fighterY+fighterW/2>treasureY && fighterY+fighterW/2<treasureY+treasureW &&
    fighterX>treasureX && fighterX<treasureX+treasureW ){
     if (hp<MaxHp-9){hp=hp+(MaxHp-9)/10;
      treasureX=floor(random(10,600));
      treasureY=floor(random(10,308));}
    else{treasureX=floor(random(10,600));
         treasureY=floor(random(10,308));}
    }
    if(fighterY>treasureY && fighterY<treasureY+treasureW &&
    fighterX+fighterW/2>treasureX && fighterX+fighterW/2<treasureX+treasureW ){
     if (hp<MaxHp-9){hp=hp+(MaxHp-9)/10;
      treasureX=floor(random(10,600));
      treasureY=floor(random(10,308));}
    else{treasureX=floor(random(10,600));
         treasureY=floor(random(10,308));}
    }
   if(fighterY+fighterW/2>treasureY && fighterY+fighterW/2<treasureY+treasureW &&
    fighterX+fighterW>treasureX && fighterX+fighterW<treasureX+treasureW ){
     if (hp<MaxHp-9){hp=hp+(MaxHp-9)/10;
      treasureX=floor(random(10,600));
      treasureY=floor(random(10,308));}
    else{treasureX=floor(random(10,600));
         treasureY=floor(random(10,308));}
    }
    if(fighterY+fighterW>treasureY && fighterY+fighterW<treasureY+treasureW &&
    fighterX+fighterW/2>treasureX && fighterX+fighterW/2<treasureX+treasureW ){
     if (hp<MaxHp-9){hp=hp+(MaxHp-9)/10;
      treasureX=floor(random(10,600));
      treasureY=floor(random(10,308));}
    else{treasureX=floor(random(10,600));
         treasureY=floor(random(10,308));}
    }
   
  image(star,treasureX,treasureY);
  fill(234,34,34);
  rectMode(CORNERS);
  rect(9,12,hp,32); 
  image(life,7,9);
  bg1X++;
  bg1X%=1282;
  bg2X++;
  bg2X%=1282;
   if (hp<MaxHp/10){gameState=GAME_OVER;}
  break;
    //GAME_OVER
  case GAME_OVER:
  image(end2,0,0);
    
    if(mouseX>width/3 && mouseY>300 && mouseX<width*2/3 && mouseY<343){
    image(end1,0,0);
    if(mousePressed){
    enemyX=0;
    hp=MaxHp-(MaxHp-9)*4/5;
    gameState=GAME_PLAYING;
    treasureX=floor(random(10,600));
    treasureY=floor(random(10,308));
    fighterX=640-fighterW;
    fighterY=480/2;
    }
  break;
    }
  }
}
void keyPressed(){
if(key==CODED){
    switch(keyCode){  
     case UP:
      upPressed=true;
      break;
    case DOWN:
      downPressed=true;
      break;
    case RIGHT:
      rightPressed=true;
      break;
    case LEFT:
      leftPressed=true;
      break;
      }
    }
}  
void keyReleased(){ 
  if(key==CODED){
   switch(keyCode){  
     case UP:
      upPressed=false;
      break;
    case DOWN:
      downPressed=false;
      break;
    case RIGHT:
      rightPressed=false;
      break;
    case LEFT:
      leftPressed=false;
      break;
     }
  }
}
