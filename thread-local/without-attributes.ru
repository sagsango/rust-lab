use std::thread;

// Define a thread-local variable
thread_local! {
    static MY_THREAD_LOCAL: u32 = 42;
}

fn main() {
    // Spawn a thread
    let handle = thread::spawn(|| {
        // Access the thread-local variable
        println!("Thread-local value: {}", MY_THREAD_LOCAL.with(|&x| x));
    });

    // Wait for the thread to finish
    handle.join().unwrap();
}

