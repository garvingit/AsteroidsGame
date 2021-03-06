
//your variable declarations here
SpaceShip ship = new SpaceShip();
aStar[] stars;
ArrayList<Bullet> bull = new ArrayList<Bullet>();
ArrayList<asteroids> ast = new ArrayList<asteroids>();
boolean isAccel, isDeccel, isRright, isRleft, isShoot;
int scoreCount = 0;

  public void setup() 
  {
    size(1000,700);
    stars = new aStar[200];
    for(int i = 0; i < stars.length; i++){
      stars[i] = new aStar();
    }
    //asteroids
    for(int i = 0; i < 50; i++){
      ast.add(new asteroids());
    }
  }

public void draw() 
{
  background(#514B4B);
  for(int i = 0; i< stars.length; i++){
    stars[i].show();
  }
  if(isAccel == true){
    ship.accelerate(.15);
    ship.show2();
  }
  ship.move();
  ship.show();
  
  //ships max speed
  if(ship.getDirectionX() > 15)ship.setDirectionX(15);
  if(ship.getDirectionX() < -15)ship.setDirectionX(-15);
  if(ship.getDirectionY() > 15)ship.setDirectionY(15);
  if(ship.getDirectionY() < -15)ship.setDirectionY(-15);
  //bullets
  for(int i = 0; i < bull.size(); i++){
    bull.get(i).move();
    bull.get(i).show();

    if((bull.get(i).getX() >width) || (bull.get(i).getX()<0) || (bull.get(i).getY() >height) || (bull.get(i).getY() < 0) )
    {     
      bull.remove(i); 
    }    
  }
  //array for asteroids 
  for(int i = 0; i < ast.size(); i++){
    ast.get(i).move();
    ast.get(i).show();
     //ship removes asteroid
    if(dist(ship.getX(), ship.getY(), ast.get(i).getX(), ast.get(i).getY()) < 30){
      ast.remove(i);
      scoreCount+=10;
    }
  }
  if(ast.size() < 15){
    ast.add(new asteroids());
    ast.add(new asteroids());
  }
  //collision between ast and bull
  for(int a = 0; a< ast.size(); a++){
    for(int b = 0; b<bull.size(); b++){
      if(dist(bull.get(b).getX(), bull.get(b).getY(), ast.get(a).getX(), ast.get(a).getY()) < 30){
      ast.remove(a);
      bull.remove(b);
      scoreCount+=10;
      break;
    }
    }
  }
  //booleans

  if(isDeccel == true){
    ship.setDirectionY(0);
    ship.setDirectionX(0);  
  }
  if(isRright == true)ship.rotate(3);
  if(isRleft == true)ship.rotate(-3);
  
  fill(0);
  textAlign(LEFT);
  textSize(30);
  text("Score: "+ scoreCount, 50,30);
  
}

  public void keyPressed(){
    if(keyCode == 32){
    bull.add(new Bullet(ship));
    bull.add(new Bullet(ship));
    bull.add(new Bullet(ship));
    bull.add(new Bullet(ship));
    }
    if(keyCode == UP){isAccel=true;}
    if(keyCode == DOWN){isDeccel=true;}
    if(keyCode == RIGHT){isRright=true;}
    if(keyCode == LEFT){isRleft=true;}
    if(keyCode == 72){
      ship.setX((int)(Math.random()*980)+10);
      ship.setY((int)(Math.random()*680)+10);
      ship.setDirectionX(0);
      ship.setDirectionY(0);
      ship.setPointDirection((int)(Math.random()*360));
    }
  }

  //public void keyTyped() {}
  public void keyReleased(){
    if(keyCode == UP){isAccel=false;}
    if(keyCode == DOWN){isDeccel=false;}
    if(keyCode == RIGHT){isRright=false;}
    if(keyCode == LEFT){isRleft=false;}
    
  }
  class aStar{
    private int starX, starY, size;
    public aStar(){
      starX = (int)(Math.random()*1000);
      starY = (int)(Math.random()*700);
      size = (int)(Math.random()*4)+1;
    }
    public void show(){
        fill(255);
        ellipse(starX,starY,size,size);
    }
  } 

class SpaceShip extends Floater {   
  public SpaceShip(){
    myCenterX = 500;
    myCenterY = 350;
    corners = 15;
    int[] xC = {0,-10,-14,-10,0,10,12,22,20,12,12,12,20,22,12,10};
    int[] yC = {14,10,0,-10,-14,-10,-8,-6,-4,-2,2,4,6,8,10};
    xCorners = xC;
    yCorners = yC;
    myDirectionX=0;
    myDirectionY=0;
    myColor=#B1906E ;
}
  public void show2(){
  noStroke();
  fill(#0099e6);
  ellipse((float)(ship.getX()-10*Math.cos(ship.getPointDirection()*(Math.PI/180))),(float)(ship.getY()-10*Math.sin(ship.getPointDirection()*(Math.PI/180))),15,15);
  }
  public void show(){
    stroke(255);
    super.show();
  }
  //setters
  public void setX(int x){myCenterX = x;}   
  public void setY(int y){myCenterY = y;}    
  public void setDirectionX(double x){myDirectionX = (double)x;} 
  public void setDirectionY(double y){myDirectionY = (double)y;}  
  public void setPointDirection(int degrees){myPointDirection = degrees;}  
  //getters 
  public int getY(){return (int)myCenterY;} 
  public int getX(){return (int)myCenterX;}
  public double getDirectionX(){return myDirectionX;}  
  public double getDirectionY(){return myDirectionY;}   
  public double getPointDirection(){return myPointDirection;} 
}

class asteroids extends Floater{
  private int rotSpeed;
  public asteroids(){
    rotSpeed = (int)(Math.random()*9)-4;
    myCenterX = (int)(Math.random()*1000);
    myCenterY = (int)(Math.random()*700);
    corners = 8;
    int[] xC = {-6,6,12,12,6,-6,-12,-12};
    int[] yC = {12,12,6,-6,-12,-12,-6,6};
    xCorners = xC;
    yCorners = yC;
    myDirectionX=Math.random();
    myDirectionY=Math.random();
    myColor=(#d3d3d3); 
    
  }
  public void move(){
    rotate(rotSpeed);
    super.move();
  }
  //setters
  public void setX(int x){myCenterX = x;}  
  public void setY(int y){myCenterY = y;}   
  public void setDirectionX(double x){myDirectionX = (double)x;} 
  public void setDirectionY(double y){myDirectionY = (double)y;}  
  public void setPointDirection(int degrees){myPointDirection = degrees;}  
  //getters 
  public int getY(){return (int)myCenterY;}  
  public int getX(){return (int)myCenterX;}
  public double getDirectionX(){return myDirectionX;}  
  public double getDirectionY(){return myDirectionY;}   
  public double getPointDirection(){return myPointDirection;} 
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians = myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
