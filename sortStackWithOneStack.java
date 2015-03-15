//sort ascending stack w/ one extra stack
public static Stack<Integer> sort(Stack<Integer> inputStack){
	Stack<Integer> sortedStack = new Stack<Integer>();

	while( !inputStack.isEmpty() ){
		//get element to sort
		int top = inputStack.pop();

		//sort top of inputStack into sortedStack
		//move sortedStack data into inputStack to make room for top of inputStack
		while( !sortedStack.isEmpty() && sortedStack.peek() < top){
			inputStack.push(sortedStack.pop());
		}
		//add in original element to be sorted in
		sortedStack.push(top);
	}
	return sortedStack;
}