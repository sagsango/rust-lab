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
    let w = &x;
    // let z = &mut x; // Mutable reference (will cause an error)

    println!("x = {}, y = {}, w = {}", x, y, w);

    let mut a:i32 = 10;
    let b: &i32= & a;
    let c: &i32= & a;
    // let d: &mut i32= &mut a; // cannot borrow `a` as mutable because it is also borrowed as immutabl

    println!("a = {}, b = {}, c = {}", a, *b, *c);

    // let e = &i32 = &c; // will give an error

    let mut p:i32 = 15;
    // let tt:&i32 = &p; // this will lead to an error because when be borrow ref p as mut
    {
        let q:&mut i32 =  &mut p;
        //println!("p = {}",p); // error because this is an immutable borrow while mutable borrow is alreay there.
        println!("q = {}", *q);
        // let r = &p;  //  cannot borrow `p` as immutable because it is also borrowed as mutable
        // println!("p = {}", p); // will give en error
        let s = &*q;
        println!(" s = {}", *s);

    }
    
    println!("p = {}, q = {}, t = {}",p, p, p);
}

