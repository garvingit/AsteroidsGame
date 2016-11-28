class Bullet extends Floater{
	public Bullet(Spaceship ship){
		myCenterX = ship.getX();
		myCenterY = ship.getY();
		myPointDirection = ship.getPointDirection();
		myDirectionX = 5* Math.cos(dRadians) + ship.getDirectionX();
		myDirectionY = 5* Math.cos(dRadians) + ship.getDirectionY();
	}
	public show(){
		fill(DBFF46);
		ellipse(myCenterX,myCenterY,50,50);
	}
}