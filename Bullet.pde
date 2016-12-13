class Bullet extends Floater{
  public Bullet(SpaceShip ship){
    myCenterX = ship.getX();
    myCenterY = ship.getY();
    myPointDirection = ship.getPointDirection();
    myDirectionX = 10* Math.cos(myPointDirection*(Math.PI/180)) + ship.getDirectionX();
    myDirectionY = 10* Math.sin(myPointDirection*(Math.PI/180)) + ship.getDirectionY();
  }
  public void show(){
    noStroke();
    fill(#ffffb3);
    ellipse((float)(myCenterX+10*Math.cos(myPointDirection*(Math.PI/180))),(float)(myCenterY+10*Math.sin(myPointDirection*(Math.PI/180))),5,5);
    
  }
  public void move()  
  {      
    myCenterX += myDirectionX;      
    myCenterY += myDirectionY;    
  }

  public void setX(int x){myCenterX = x;}  
  public void setY(int y){myCenterY = y;}   
  public void setDirectionX(double x){myDirectionX = (double)x;}  
  public void setDirectionY(double y){myDirectionY = (double)y;}  
  public void setPointDirection(int degrees){myPointDirection = degrees;}  
  public int getY(){return (int)myCenterY;}  
  public int getX(){return (int)myCenterX;}
  public double getDirectionX(){return myDirectionX;}  
  public double getDirectionY(){return myDirectionY;}   
  public double getPointDirection(){return myPointDirection;} 
}
