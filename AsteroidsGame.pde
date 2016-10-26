//your variable declarations here
SpaceShip ship = new SpaceShip();
public void setup() 
{

  size(500,500);
}
public void draw() 
{
  background(255);
  ship.move();
  ship.show();
}
public void keyPressed(){
  //up key "W"
  if (keyCode == 87 || keyCode == UP){
  ship.accelerate(.5);
  }
  //right key 'D'
  if (keyCode == 68 || keyCode == RIGHT){
  ship.rotate(15);
  }
  //left key 'A'
  if (keyCode == 65 || keyCode == LEFT){
  ship.rotate(-15);
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
class SpaceShip extends Floater  
{   
  private double mydX = 0;
  public SpaceShip(){
    setX(250);
    setY(250);
    corners = 3;
    int[] xC = {-8,16,-8};
    int[] yC = {-8,0,8};
    xCorners = xC;
    yCorners = yC;
    setDirectionX(0);
    setDirectionY(0);
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
class star{
  private int random500;
  public void star(){
    random500 = (int)(Math.random()*500);

  }
  public void show(){
      ellipse(random500,random500,5,5);
  }
} 

