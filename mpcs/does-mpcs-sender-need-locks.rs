use std::fs::OpenOptions;
use std::io::Write;
use std::sync::mpsc;
use std::thread;
use std::time::Duration;

fn main() {
    // Create a channel with a sender (tx) and a receiver (rx)
    let (tx, rx) = mpsc::channel();

    // Clone the sender for the second thread
    let tx1 = tx.clone();

    // Spawn the first sender thread
    thread::spawn(move || {
	for i in 1..10000000{
            tx.send(String::from("Hello from thread 1")).unwrap();
        }
    });

    // Spawn the second sender thread
    thread::spawn(move || {
	for i in 1..10000000{
            tx1.send( String::from("Thread 2 checking in")).unwrap();
        }
    });

    // Open the file in append mode to write the received messages
    let mut file = OpenOptions::new()
        .append(true)
        .create(true)
        .open("output.txt")
        .unwrap();

    // Main thread: receive and write the messages to the file
    for received in rx {
        writeln!(file, "Received: {}", received).unwrap();
        file.flush().unwrap(); // Ensure no buffering, write immediately
    }
}

