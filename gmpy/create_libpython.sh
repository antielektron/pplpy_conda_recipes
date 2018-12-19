#!/bin/bash

cd $BUILD_PREFIX
gendef python${CONDA_PY}.dll
dlltool --dllname python${CONDA_PY}.dll --def python${CONDA_PY}.def --output-lib libpython${CONDA_PY}.a
cp libpython${CONDA_PY}.a ./libs
