# PPLPY conda package

pplpy conda recipe for [version 0.7](https://github.com/videlec/pplpy/tree/0.7)

* **Note**: for future releases the url of the repository has moved to: https://gitlab.com/videlec/pplpy. But since there are no version tags defined so far the old github url should be used for versions <= 0.7

## Build

* `conda install ./`



## Applied Patches

pplpy > 0.6 uses [cysignals](https://github.com/sagemath/cysignals) to handle interrupt signals given by the user (e.g. `CTRL+C`). Unfortunately cysignals only exists for unix-like operation systems and has no windows version so far. Therefore the [patch](windows_and_msys2_compability.patch) given in this recipe removes any cysignals import and redefines empty dummy functions for `sig_on` and `sig_off`. The patch also changes the order of imported libraries since gcc needs the linker flags `-lgmp`  and `-lgmpxx` to be set after `-lppl`

to archive this in every `*.pyx` file the import order is changed from

```cython
# distutils: libraries = gmp gmpxx ppl m
```

to

```cython
# distutils: libraries = ppl m gmp gmpxx
```



## Tools and scripts

during the execution of [`bld.bat`](bld.bat) the following scripts are called:

* [create_libpython.sh](create_libpython.sh): uses `gendef ` and `dlltool` to create a static library from the `python.dll` in Anaconda's build environment
* [environment.sh](environment.sh) is sourced to define environment variables for mingw's include and library paths
* [win_build.sh](win_build.sh) bash script to call setup.py



the folder [lib/](lib) contains a dummy [`msvcr140.lib`](lib/msvcr140.lib) which is empty and only there to avoid linker errors. Depending on which Anaconda version is used, the version number of the library may have to be adjusted 