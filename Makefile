SIMULA=cim

SOURCE_FILES=\
	src/bignum.sim

TEST_FILES=\
	test/test.sim \
	test/bignum_test.sim \
	test/add_test.sim \
	test/compare_test.sim \
	test/subtract_test.sim

all: default

default: clean test

test: build_tests run_tests

build_tests:
	mkdir build
	cd build; \
	$(SIMULA) -S -o bignum.atr ../src/bignum.sim; \
	sleep 1; \
	$(SIMULA) -o bignum.o ../src/bignum.sim; \
	$(SIMULA) -S -o test.atr ../tests/test.sim; \
	sleep 1; \
	$(SIMULA) -o test.o ../tests/test.sim; \
	$(SIMULA) -o ../build/bignum_test ../tests/bignum_test.sim; \
	$(SIMULA) -o ../build/compare_test ../tests/compare_test.sim; \
	$(SIMULA) -o ../build/add_test ../tests/add_test.sim; \
	$(SIMULA) -o ../build/subtract_test ../tests/subtract_test.sim; \
	cd ..

run_tests:
	./build/bignum_test
	./build/add_test
	./build/compare_test
	./build/subtract_test

clean:
	rm -rf build
	rm -rf *.atr
	rm -rf *.c
	rm -rf *.o
