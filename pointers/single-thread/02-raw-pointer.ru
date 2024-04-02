/*
    Raw Pointers (*const T and *mut T):
    Raw pointers provide low-level access to memory similar to pointers in languages like C and C++.
    They can be null and are not automatically dereferenced.
    Raw pointers are unsafe to use because they bypass Rust's ownership and borrowing rules, so extra caution is needed when using them.
*/

fn main() {
    let x = 5;
    let raw_ptr: *const i32 = &x;

    /* raw pointers = no borrow | no referance */

    unsafe {
        println!("Value at address {:p} is {}", raw_ptr, *raw_ptr);
    }

    println!("x = {}", x);
}

