
# TODO: use the conda build env variables
export C_INCLUDE_PATH=$UNIX_STYLE_BUILD_PREFIX/Library/include:$UNIX_STYLE_BUILD_PREFIX/include
export CPLUS_INCLUDE_PATH=$UNIX_STYLE_BUILD_PREFIX/Library/include:$UNIX_STYLE_BUILD_PREFIX/include

export LDFLAGS="-M"

export LIBRARY_PATH="$UNIX_STYLE_RECIPE_DIR/lib:$UNIX_STYLE_BUILD_PREFIX/Library/lib"
#"/c/Users/jonas/Anaconda3:\
#/c/Users/jonas/Anaconda3/PCbuild/amd64:"

#/c/Users/jonas/Anaconda3/pkgs/python-3.7.1-h33f27b4_4/libs
