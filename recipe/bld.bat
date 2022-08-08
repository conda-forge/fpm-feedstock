mkdir %LIBRARY_BIN%
copy fpm.exe %LIBRARY_BIN%
if %errorlevel% neq 0 exit /b %errorlevel%
