clean:
	rm -rf build/
	mkdir build/

packcc: shock.peg
	cd build/ && packcc -o shock ../shock.peg

clang: packcc
	clang -g build/shock.c -o build/shock

debug: clang
	lldb build/shock

run: clean clang
	cat input.txt | build/shock
