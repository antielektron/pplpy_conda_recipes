# libmsvcr140

this directory contains a fake `msvcr140.lib`/`libmsvcr140.a` which is just an empty library. It's only purpose is to handle cythons `-lmsvcr140` flag which cannot be removed when compiling cython code with mingw

