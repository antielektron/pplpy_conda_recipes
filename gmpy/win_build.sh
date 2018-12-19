#!/bin/bash

. $UNIX_STYLE_RECIPE_DIR/environment.sh
cd $UNIX_STYLE_SRC_DIR
python ./setup.py build --compiler=mingw32 install
