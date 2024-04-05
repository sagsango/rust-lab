/*
   References (&T):
   - References are the most common form of pointers in Rust.
   - They allow you to borrow a value without taking ownership.
   - There are two types of references: immutable (&T) and mutable (&mut T).
   - References ensure memory safety by enforcing the borrowing rules at compile time, 
   preventing data races and dangling pointers.
 */

fn fun(var: &mut i32) {
	*var += 1;
	println!("var val:{}", var);
}

fn main() {
	{
		let x = 5;
		let y = &x; // Immutable reference
		let w = &x;
		// let z = &mut x; // Mutable reference (will cause an error)
		println!("x = {}, y = {}, w = {}", x, y, w);
	}


	{
		let mut a:i32 = 10;
		let b: &i32= & a;
		let c: &i32= & a;

		/* ensure that you don't have any other references to the variable before trying to access it mutably*/
		// let d: &mut i32= &mut a; // cannot borrow `a` as mutable because it is also borrowed as immutabl
		// fun(&mut a); // rustc --explain E0502

		println!("a = {}, b = {}, c = {}", a, *b, *c);

		// let e = &i32 = &c; // will give an error
	}

	{
		let mut p:i32 = 15;
		// let tt:&i32 = &p; // this will lead to an error because when we borrow ref p as mut later
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


	{
		let mut var:i32 = 64;
		let ref1: &mut i32 = &mut var;
		// let ref2: &mut i32 = &mut var;	// cannot borrow `var` as mutable more than once at a time
		// Some errors have detailed explanations: E0499, E0503 

		// var += 1; // use of borrowed `var`
		*ref1 += 1;
		// *ref2 += 1;

		// println!("{}", var); // this will give error

		// this will end ref1 
		println!("{}", *ref1);

		var += 1;
		println!("{}", var);
	}
}

