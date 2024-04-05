use std::alloc::{alloc, dealloc, Layout};
use std::ptr;

struct MyStruct {
    data: i32,
}

impl MyStruct {
    fn new(value: i32) -> Self {
        MyStruct { data: value }
    }
}

fn main() {
    // Allocate memory for MyStruct on the heap
    let layout = Layout::new::<MyStruct>();
    let ptr = unsafe {
        let ptr = alloc(layout) as *mut MyStruct;
        if ptr.is_null() {
            panic!("Failed to allocate memory");
        }
        ptr
    };

    // Initialize the struct
    unsafe {
        ptr::write(ptr, MyStruct::new(42));
    }

    // Access the struct
    let my_struct;
    unsafe {
        my_struct = &*ptr;
        println!("Data: {}", my_struct.data);
    }

    // Deallocate memory
    unsafe {
        dealloc(ptr as *mut u8, layout);
    }
}

