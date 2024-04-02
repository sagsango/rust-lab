/*

    Box Pointers (Box<T>):
    A box is a smart pointer with a fixed size that points to data stored on the heap.
    Boxes provide ownership and allow you to have a single owner of the data they point to.
    They are typically used when you need to allocate memory on the heap and have a single owner for that data.

*/


fn main() {
    let x = Box::new(5);
    println!("Value stored in the box: {}", x);


    let y = x;

    // println!("value of x:{}", x);  // It wil give error because x has been borrowed
    println!("value of y:{}", y);

    let z = &y;
    // println!("value of y:{}", y); // It wil give error because z has been borrowed
    println!("value of *z:{}", *z);


    /*
        Box are like general rust variable
        the only differance thry are on heap rather than stack
    */

}


