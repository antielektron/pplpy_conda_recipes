# GMPY conda receipe

* this is a recipe for [gmpy2](https://github.com/aleaxit/gmpy)
    * current version is `2.1.0a4`, extended by one [commit](https://github.com/aleaxit/gmpy/commit/b6a8ea6188352139a7d28342ee4630e14c65b7e5) to address an [issue in `qdiv()`](https://github.com/aleaxit/gmpy/issues/207)

## Build

* `conda install ./`



## Applied Patches

* [patch 1:](fix.patch) ignoring preprocessor test for `__MPIR_VERSION` because that variable is defined by some dependency although we're not using mpir

* [patch 2:](fix_ignore_typecheck.patch) ignore test for: 

    ```c
    sizeof(mp_bitcnt_t) != sizeof(PY_LONG_LONG)
    ```
    * `mp_bitcnt_t` is `unsinged long` (according to gmp's [documentation](https://gmplib.org/manual/Nomenclature-and-Types.html))
    * `PY_LONG_LONG` is `long long` (defined in python's `pyport.h`)

    these types have the same bitlength on a unix system but not on [win64](https://de.cppreference.com/w/cpp/language/types) so the test cannot succeed. 

    **Not sure if this is a problem in some use cases!**

## Tools and scripts

during the execution of [`bld.bat`](bld.bat) the following scripts are called:

* [create_libpython.sh](create_libpython.sh): uses `gendef ` and `dlltool` to create a static library from the `python.dll` in Anaconda's build environment

* [environment.sh](environment.sh) is sourced to define environment variables for mingw's include and library paths
* [win_build.sh](win_build.sh) bash script to call setup.py



the folder [lib/](lib) contains a dummy [`msvcr140.lib`](lib/msvcr140.lib) which is empty and only there to avoid linker errors. Depending on which Anaconda version is used, the version number of the library may have to be adjusted 