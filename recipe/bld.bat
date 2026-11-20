@echo on
setlocal enabledelayedexpansion

set bootstrap=build\bootstrap
set FPM_FC=%FC%
set FPM_CC=%CC%
set FPM_AR=%AR%
REM fpm 0.14.0 pins a libgfortran-internal locale counter on MinGW (a crash workaround),
REM which the libgfortran DLL does not export: link libgfortran statically, as fpm releases do.
set FPM_LDFLAGS=%LDFLAGS% -fopenmp -static-libgfortran -static-libquadmath
set FPM_FFLAGS=%FFLAGS% -fopenmp
set FPM_CFLAGS=%CFLAGS%

mkdir %bootstrap%
%FC% -J %bootstrap% -o %bootstrap%\fpm.exe %bootstrap%\fpm.F90
if %ERRORLEVEL% neq 0 exit 1

%bootstrap%\fpm.exe install --prefix %LIBRARY_PREFIX%
if %ERRORLEVEL% neq 0 exit 1
