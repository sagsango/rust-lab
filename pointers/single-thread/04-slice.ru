/*
    Sice References (&[T]):
    Slices are references to contiguous sequences of elements stored in memory.
    They are often used to represent arrays or portions of arrays.
    Slices are used extensively in Rust for passing around collections of data.
*/

/*


    Slices in Rust follow the borrowing semantics. When you create a slice from a collection,
    you're effectively borrowing a portion of that collection. Slices do not have ownership
    over the data they reference;

*/

fn main() {
    let arr = [1, 2, 3, 4, 5];
    let slice = &arr[1..3];
    println!("Slice: {:?}", slice);
}

