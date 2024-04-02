use std::sync::Arc;
use std::thread;

fn main() {
    let data = Arc::new(vec![1, 2, 3]);
    let mut threads = vec![];

    for _ in 0..3 {
        let data_clone = Arc::clone(&data);
        let thread_handle = thread::spawn(move || {
            println!("{:?}", data_clone);
        });
        threads.push(thread_handle);
    }

    // Wait for all threads to finish
    for thread_handle in threads {
        let _ = thread_handle.join(); // Ignore the result
    }

    println!("All child threads finished. Continuing execution in the main thread.");
}

