/*
    References (&T):
    References are the most common form of pointers in Rust.
    They allow you to borrow a value without taking ownership.
    There are two types of references: immutable (&T) and mutable (&mut T).
    References ensure memory safety by enforcing the borrowing rules at compile time, preventing data races and dangling pointers.
*/
fn main() {
    let x = 5;
    let y = &x; // Immutable reference
    // let z = &mut x; // Mutable reference (will cause an error)


    let mut a:i32 = 10;
    let b: &mut i32= &mut a;
    // let c: &i32 = &a; // will give error


    // println!("x:{}, y:{}", x, a); // This is an error because x & a has already been borrowed
    println!("x:{}, y:{}", *y, *b);

}

