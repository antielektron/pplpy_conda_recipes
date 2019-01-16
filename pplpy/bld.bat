
set INCLUDE=%LIBRARY_INC%
set LIB=%LIBRARY_LIB%
set LIBPATH=%LIBRARY_LIB%
set INSTALL_PREFIX=%LIBRARY_PREFIX%

set "UNIX_STYLE_INSTALL_PREFIX=%INSTALL_PREFIX:\=/%"
set "UNIX_STYLE_BUILD_PREFIX=%BUILD_PREFIX:\=/%"
set "UNIX_STYLE_BUILD_PREFIX=%UNIX_STYLE_BUILD_PREFIX:C:=/c%"

set "UNIX_STYLE_RECIPE_DIR=%RECIPE_DIR:\=/%"
set "UNIX_STYLE_RECIPE_DIR=%UNIX_STYLE_RECIPE_DIR:C:=/c%"
set "UNIX_STYLE_RECIPE_DIR=%UNIX_STYLE_RECIPE_DIR:I:=/i%"

set "UNIX_STYLE_SRC_DIR=%SRC_DIR:\=/%"
set "UNIX_STYLE_SRC_DIR=%UNIX_STYLE_SRC_DIR:C:=/c%"
set "UNIX_STYLE_SRC_DIR=%UNIX_STYLE_SRC_DIR:I:=/i%"

bash %UNIX_STYLE_RECIPE_DIR%/create_libpython.sh
bash %UNIX_STYLE_RECIPE_DIR%/win_build.sh
