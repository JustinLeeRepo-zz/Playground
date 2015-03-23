public abstract class Animal {
	private int order;
	protected String name;
	public Animal(string n){
		name = n;
	}

	public void setOrder(int n){
		order = n;
	}

	public int getOrder(){
		return order;
	}

	public boolean isOlderThan(Animal a){
		return this.order > a.getOrder();
	}
}

public class animalQueue {
	LinkedList<Dog> dogs = new LinkedList<Dog>;
	LinkedList<Cat> cats = new LinkedList<Cat>;
	private int order = 0;
	
	public void enqueue(Animal a){
		a.setOrder(order++);
		if(a instanceof Dog){
			dogs.addLast((Dog) a);
		}
		else if(a instanceof Cat){
			cats.addLast((Cat) a);
		}
		else{
			throw Exception("not dog or cat!")
		}
	}
	
	public Animal dequeAny(Animal a){
		if (dog.size == 0){
			
		}
		else if (cat.size == 0){
			
		}
	}
}