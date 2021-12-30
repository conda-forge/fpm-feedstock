mkdir %PREFIX%\bin
copy fpm.exe %PREFIX%\bin
if %errorlevel% neq 0 exit /b %errorlevel%
