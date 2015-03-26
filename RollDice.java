/*Justin Lee
 *AP Computer Science
 *September 21, 2009*/
 
 class RollDice {
 	public static void main(String[] args) {
 	
 	Die one;
 	one = new Die();
 	
 	one.roll();
 	System.out.println("Results are "  + one.getNumber( ));
 	one.roll();
 	System.out.println("Results are "  + one.getNumber( ));
 	one.roll();
 	System.out.println("Results are "  + one.getNumber( ));
 	}
 }