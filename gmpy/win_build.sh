#!/bin/bash

. $UNIX_STYLE_RECIPE_DIR/environment.sh
cd $UNIX_STYLE_SRC_DIR
python ./setup.py build --compiler=mingw32

# for some strange reason the generated gmpy2.h and gmpy2.pxd only contains a relative path to the source pxd in the temporary build folder. So we have to copy th file manually to the generated build
cp src/gmpy2.pxd build/lib.*/gmpy2/
cp src/gmpy2.h build/lib.*/gmpy2/ 

python ./setup.py install

