#![feature(thread_local)]

#[thread_local]
static MY_THREAD_LOCAL: u32 = 42;

fn main() {
    println!("Main thread: {}", MY_THREAD_LOCAL);

    // Spawn a new thread
    let handle = std::thread::spawn(|| {
        println!("Thread-local value in spawned thread: {}", MY_THREAD_LOCAL);
    });

    // Wait for the thread to finish
    handle.join().unwrap();
}

