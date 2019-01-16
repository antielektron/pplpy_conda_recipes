set INCLUDE=%LIBRARY_INC%
set LIB=%LIBRARY_LIB%
set LIBPATH=%LIBRARY_LIB%
set INSTALL_PREFIX=%LIBRARY_PREFIX%

set "UNIX_STYLE_INSTALL_PREFIX=%INSTALL_PREFIX:\=/%"

REM Build step

sh configure --prefix=%UNIX_STYLE_INSTALL_PREFIX% --enable-shared
make -j12

REM Install step

echo "install to %LIBRARY_PREFIX%"
make install

MOVE %INSTALL_PREFIX%\lib\libppl.a %INSTALL_PREFIX%\lib\ppl.lib
MOVE %INSTALL_PREFIX%\lib\libppl_c.a %INSTALL_PREFIX%\lib\ppl_c.lib
