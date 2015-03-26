/*Justin Lee*/
class Die {
	private static final int MAX_NUMBER = 6;
	private static final int MIN_NUMBER = 1;
	private static final int NO_NUMBER = 0;
	private int number;
	public Die( ) {
		number = NO_NUMBER;
	
	}
	public void roll ( ) {
		number = (int) (Math.floor(Math.random() * (MAX_NUMBER - MIN_NUMBER + 1)) + MIN_NUMBER);
	}
	public int getNumber( ) {
		return number;
	}
	
}
