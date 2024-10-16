%FC% -J build\bootstrap -o build\bootstrap\fpm.exe build\bootstrap\fpm.F90
if %errorlevel% neq 0 exit /b %errorlevel%

set FPM_FC=%FC%
set FPM_CC=%CC%
build\bootstrap\fpm.exe install --prefix %PREFIX%
if %errorlevel% neq 0 exit /b %errorlevel%
