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

public class Dog extends Animal {
	public Dog(string n){
		super(n);
	}
}

public class Cat extends Animal {
	public Cat(string n){
		super(n);
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
	
	public Dog dequeDog(){
		return dogs.remove();
	}
	
	public Cat dequeCat(){
		return cats.remove();
	}
	
	public Animal dequeAny(Animal a){
		if (dogs.size == 0){
			return dequeCat();
		}
		else if (cats.size == 0){
			return dequeDog();
		}
	
		Dog d = dogs.head;
		Cat c = cats.head;
		
		if(d.isOlderThan(c)){
			return dequeDog();
		}
		else{
			return dequeCat();
		}
	}
}
