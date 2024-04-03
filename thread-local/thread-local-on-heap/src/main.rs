extern crate thread_local;

use thread_local::ThreadLocal;
use std::cell::Cell;
use std::thread;

fn main() {
    let tls = ThreadLocal::new();

    // Create a bunch of threads to do stuff
    let handles: Vec<_> = (0..5).map(|_| {
        let tls2 = tls.clone();
        thread::spawn(move || {
            // Increment a counter to count some event...
            let cell = tls2.get_or(|| Cell::new(0));
            cell.set(cell.get() + 1);
        })
    }).collect();

    // Wait for all threads to finish
    for handle in handles {
        handle.join().unwrap();
    }

    // Once all threads are done, collect the counter values and return the
    // sum of all thread-local counter values.
    let total = tls.with(|tls| {
        tls.into_inner().into_iter().fold(0, |x, y| x + y.get())
    });
    assert_eq!(total, 5);
}

