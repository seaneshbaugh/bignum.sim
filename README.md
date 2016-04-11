# bignum.sim

Integer Bignum library for Simula.

Supports the following operations:

* Add
* ~Divide~
* ~Multiply~
* Print
* Subtract
* ~SquareRoot~
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

## Tests

To run the tests just run `make`. The test files will compile and then the resulting test binaries will run and report their results one at a time.
