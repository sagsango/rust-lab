use std::sync::{Arc, Mutex};
use std::thread;

fn main() {
    let data = Arc::new(Mutex::new(vec![1, 2, 3]));
    let mut threads = vec![];

    for _ in 0..3 {
        let data_clone = Arc::clone(&data);
        let thread_handle = thread::spawn(move || {
            let mut data = data_clone.lock().unwrap();
            let len = data.len();
            data.push(len as i32 + 1);
        });
        threads.push(thread_handle);
    }

    /* Wait for all threads to finish */
    for thread_handle in threads {
        let _ = thread_handle.join(); /* Ignore the result */
    }

    /* Now that all threads have finished modifying the data, print the final result */
    let data_final = data.lock().unwrap();
    println!("Modified data: {:?}", *data_final);

    println!("All child threads finished. Continuing execution in the main thread.");
}



/*
    NOTE: 
        In Rust, you don't explicitly unlock a Mutex as you would in some other programming languages.
        The lock is automatically released when the mutex guard goes out of scope.
        This is enforced by Rust's ownership and borrowing rules, ensuring that the mutex guard
        is always released correctly, even in the presence of panics.
*/
