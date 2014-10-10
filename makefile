all: pytestpy.so

libpytest.so: pytest.d
	dmd -fPIC -shared pytest.d -oflibpytest.so -defaultlib=libphobos2.so
pytestpy.so: libpytest.so pytestpy.pyx setup.py
	python setup.py build_ext -i --rpath=. --library-dirs=.
clean:
	rm *.o -f
	rm *.so -f
	rm -rf build
	rm -f pytestpy.c
