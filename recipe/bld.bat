@echo on
setlocal enabledelayedexpansion

set bootstrap=build\bootstrap
set FPM_FC=%FC%
set FPM_CC=%CC%
set FPM_AR=%AR%
set FPM_LDFLAGS=%LDFLAGS% -fopenmp
set FPM_FCFLAGS=%FCFLAGS% -fopenmp
set FPM_CFLAGS=%CFLAGS%

mkdir %bootstrap%
%FC% -J %bootstrap% -o %bootstrap%\fpm.exe %bootstrap%\fpm.F90
if %ERRORLEVEL% neq 0 exit 1

%bootstrap%\fpm.exe install --prefix %LIBRARY_PREFIX%
if %ERRORLEVEL% neq 0 exit 1
