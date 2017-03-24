REM Configure step
copy jconfig.vc jconfig.h
if errorlevel 1 exit 1

set CC=clcache
set CXX=clcache
clcache -M 104857600
set "CLCACHE_BASEDIR=%SRC_DIR%
clcache -z


REM Build step
cmake -G "NMake Makefiles" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Release .
if errorlevel 1 exit 1

echo "################"
echo %CC%
echo %CXX%
clcache -s
echo "################"

nmake
if errorlevel 1 exit 1
clcache -s

REM Install step
nmake install
if errorlevel 1 exit 1
