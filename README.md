# bignum.sim

Integer Bignum library for Simula.

Supports the following operations:

* Add
* ~~Divide~~
* Multiply
* Print
* Subtract
* ToString

## Usage

These instructions assume you're using [cim](http://simula67.at.ifi.uio.no/cim.shtml).

To include bignum.sim in your project you must first compile `src/bignum.sim`.

Assuming your project directory is structured like this:

    my_project
    ├── Makefile
    ├── README.md
    ├── build
    ├── src
    │  └── main.sim
    └── vendor
       └── bignum.sim
          └── src
             └── bignum.sim

Where `my_project/src` is where you keep your own source files and `my_project/vendor` is where bignum.sim lives, most likely as a git submodule (irrelevant files in this project have been omitted from the tree under `my_project/vendor/bignum.sim`).

`cd` into your `build` directory (to keep everything else clean) and run the following commands to first create the atr file for Simula and then the object file for the linker.

    $ cim -S -o bignum.atr ../vendor/bignum.sim/src/bignum.sim
    $ cim -o bignum.o ../vendor/bignum.sim/src/bignum.sim

You will now have `bignum.atr` and `bignum.o` in the `build` directory. Both will be needed to compile main source file.

Here is an example `main.sim`:

    EXTERNAL CLASS Bignum;

    BEGIN
       REF(Bignum) huge;

       huge :- NEW Bignum("1000000000000");

       huge.print;

       OutImage;
    END;

Stay in the `build` directory and run the following:

    $ cim -o main ../src/main.sim

All that's really necessary is for the `bignum.atr` and `bignum.o` files to be in the directory in which you compile the main source file.

### Available Functions

#### Add

##### Signature

    REF(Bignum) PROCEDURE Add(other); REF(Bignum) other;

##### Description

Adds two numbers. Returns a new Bignum with the result.

##### Example

    REF(Bignum) a, b, c;

    a :- NEW Bignum("1");

    b :- NEW Bignum("1");

    c :- a.Add(b);

    c.Print; ! prints "2";

#### Compare

##### Signature

    INTEGER PROCEDURE Compare(other); REF(Bignum) other;

##### Description

Three-way compare two numbers. Returns -1 if the argument is less than the number called upon, 0 if they are equal, and 1 if it is greater.

##### Example

    REF(Bignum) a, b;

    a :- NEW Bignum("10");

    b :- NEW Bignum("100");

    a.Compare(b); ! returns -1;

#### DigitLeftShift

##### Signature

    PROCEDURE DigitLeftShift(d); INTEGER d;

##### Description

Shift a number's digits to the left d times. Destructively modifies the number and does not return anything. The argument d must be an INTEGER greater than 0. This is equivalent to multiplying by 10^d.

##### Example

    REF(Bignum) a;

    a :- NEW Bignum("10");

    a.DigitShiftLeft(2);

    a.Print ! prints "1000";

#### DigitRightShift

##### Signature

    PROCEDURE DigitRightShift(d); INTEGER d;

##### Description

Shift a number's digits to the right d times. Destructively modifies the number and does not return anything. The argument d must be an INTEGER greater than 0. This is equivalent to dividing by 10^d.

##### Example

    REF(Bignum) a;

    a :- NEW Bignum("12345");

    a.DigitShiftRight(3);

    a.Print; ! prints "12";

#### Multiply

##### Signature

    REF(Bignum) PROCEDURE Multiply(other); REF(Bignum) other;

##### Description

Multiply two numbers. Returns a new Bignum with the result.

##### Example

    REF(Bignum) a, b, c;

    a :- NEW Bignum("2");

    b :- NEW Bignum("4");

    c :- a.Multiply(b);

    c.Print; ! prints "4";

#### Print

##### Signature

    PROCEDURE Print;

##### Description

Prints a number to standard out.

##### Example

    REF(Bignum) a;

    a :- NEW Bignum("9876");

    a.Print; ! prints "9876";

#### ToString

##### Signature

    TEXT PROCEDURE ToString;

##### Description

Converts a Bignum to TEXT.

##### Example

    REF(Bignum) a;

    a :- NEW Bignum("112233");

    a.ToString; ! returns "112233";

## Tests

To run the tests just run `make`. The test files will compile and then the resulting test binaries will run and report their results one at a time.
