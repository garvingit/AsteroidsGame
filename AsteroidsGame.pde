//your variable declarations here
SpaceShip ship = new SpaceShip();
aStar[] stars;
asteroids[] ast;
public void setup() 
{
  size(500,500);
  stars = new aStar[100];
  for(int i = 0; i < stars.length; i++){
    stars[i] = new aStar();
  }
  ast = new asteroids[10];
  for(int i = 0; i < ast.length; i++){
    ast[i] = new asteroids();
  }
  
}
public void draw() 
{
  background(255);
  ship.move();
  ship.show();
  for(int i = 0; i< stars.length; i++){
    stars[i].show();
  }
  for(int i = 0; i < ast.length; i++){
    ast[i].move();
    ast[i].show();
  }

  
}
public void keyPressed(){
  //up key "W" accelerate
  if (keyCode == UP){
  ship.accelerate(.75);
  }
  //right key 'D' right rotate
  if (keyCode == RIGHT){
  ship.rotate(5);
  }
  //left key 'A' left rotate
  if (keyCode == LEFT){
  ship.rotate(-5);
  }
  //decelerate down
  if(keyCode == DOWN){
    ship.accelerate(-.75);
    //-----------------------------------------------------------
    if(ship.getDirectionX() < 0 || ship.getDirectionY() < 0)
  }
  //hyperspace
  if(keyCode == 72){
    ship.setX((int)(Math.random()*500));
    ship.setY((int)(Math.random()*500));
    ship.setDirectionX(0);
    ship.setDirectionY(0);
    ship.setPointDirection((int)(Math.random()*360));
  }

}
class aStar{
  private int starX, starY, size;
  public aStar(){
    starX = (int)(Math.random()*500);
    starY = (int)(Math.random()*500);
    size = (int)(Math.random()*4)+1;
  }
  public void show(){
      fill(0);
      ellipse(starX,starY,size,size);
  }
} 

class SpaceShip extends Floater  
{   
  public SpaceShip(){
    myCenterX = 250;
    myCenterY = 250;
    corners = 3;
    int[] xC = {-6,12,-6};
    int[] yC = {-6,0,6};
    xCorners = xC;
    yCorners = yC;
    myDirectionX=0;
    myDirectionY=0;
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
    myCenterX = (int)(Math.random()*500);
    myCenterY = (int)(Math.random()*500);
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
