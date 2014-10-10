cdef extern long pytest(long a)

cpdef pytestpy():
        return pytest(109)


