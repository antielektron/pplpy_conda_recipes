# Developer Notes

some notes about packaging stuff with anaconda on windows. For packaging in general see 

* https://conda.io/docs/user-guide/tutorials/build-pkgs.html

in short: the main configuration of each recipe is provided by a `meta.yaml` file. The build process on windows is done by executing the file `bld.bat` in the extracted source archive (which url is given in `meta.yaml`) . 

a typical `meta.yaml` looks like the one for [ppl](ppl/meta.yaml):

```yaml
package:
  name: libppl
  version: "1.2"

source:
  fn: ppl-1.2.tar.gz
  url: http://www.bugseng.com/products/ppl/download/ftp/releases/1.2/ppl-1.2.tar.gz
  md5: 2b43339316a3139fd75c7e8ca7ddc201

channels:
  - msys2

requirements:
  build:
    - m2w64-gmp
    - m2w64-gcc-libs
    - posix
    - m2w64-gcc 
    - m2-autoconf
  run:
    - m2w64-gmp
    - m2w64-gcc-libs


build:
  number: 1

about:
  home: https://the-cake-is-a-lie.net/gogs/jonas/ppl_anaconda
  license: GPL3
```

when building a package with `conda build` a new anaconda environment is created in `conda-bld\` in Anaconda's root folder. The required packages given in the **build** section are installed in it and then either the script `bld.bat` will be executed or a command given in `meta.yaml`'s build section (e.g. in the [gmpy receipe](gmpy/meta.yaml):

```yaml
build:
    number: '1002'
    script:
        - python setup.py build
        - python setup.py install
    string: py37h7db29ea_1002
```

)

the packages given in **run** are the runtime dependencies for the built package 

The source can be either an url for an archive, e.g.:

```yaml
source:
  fn: ppl-1.2.tar.gz
  url: http://www.bugseng.com/products/ppl/download/ftp/releases/1.2/ppl-1.2.tar.gz
  md5: 2b43339316a3139fd75c7e8ca7ddc201
```

or a git repository with a specific tag, e.g.:

```yaml
source:
  patches:
    - windows_and_msys2_compability.patch
  git_url: https://github.com/videlec/pplpy.git
  git_rev: 0.7
```

as seen in the example above also patches can be applied during the build process which have to created with git's `diff` command.

`ppl` and `pplpy` are built using a mingw compiler and libraries from anaconda's [msys2 channel](https://anaconda.org/msys2)