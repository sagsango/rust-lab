use std::sync::Arc;
use std::thread;

fn main() {
	/*
	   Arc::new(vec![1, 2, 3]) allocates memory in two places:
	   1. Heap Allocation for Integer: When you call Arc::new(1), Rust allocates memory on the heap 
	      to hold the integer value 1. This is because integers in Rust are of fixed size and are 
              typically stored on the stack. However, Arc requires data to be heap-allocated so it 
	      can manage shared ownership across multiple threads.
	   2. Arc Allocation: The Arc::new(...) part allocates memory for the Arc structure itself 
	      on the heap. This structure contains a pointer to the heap-allocated 
	      vector data and maintains the reference count for that data.
	 */
	let data = Arc::new(vec![1, 2, 3]);
	let mut threads = vec![];

	for _ in 0..3 {
		/*
		   In Rust, Arc::clone(&data) does not allocate memory for the data itself.
		   Instead, it only increments the reference count of the underlying data 
		   held by the Arc.
		 */
		let data_clone = Arc::clone(&data);
		let thread_handle = thread::spawn(move || {
				println!("{:?}", data_clone);
		});
		threads.push(thread_handle);
	}

	/* Wait for all threads to finish */
	for thread_handle in threads {
		let _ = thread_handle.join(); /* Ignore the result */
	}

	println!("All child threads finished. Continuing execution in the main thread.");
}

