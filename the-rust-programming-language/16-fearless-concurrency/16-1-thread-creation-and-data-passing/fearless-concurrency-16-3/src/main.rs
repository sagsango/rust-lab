/*
thread::spawn takes no arguments: we’re not using any data from the main thread in the spawned thread’s code. To use data from the main thread in the spawned thread, the spawned thread’s closure must capture the values it needs.
*/
use std::thread;
fn main() {
	let v = vec![1, 2, 3];
	let handle = thread::spawn(|| {
			println!("Here's a vector: {:?}", v);
			});
	handle.join().unwrap();
}
