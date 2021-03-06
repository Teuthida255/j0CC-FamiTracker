setlocal

cd %~dp0
set drivers=%cd%
cd asm\build || goto :error

lua build_engine.lua || goto :error
copy drivers\* %drivers%\ || goto :error
rmdir /s /q drivers || goto :error
goto :EOF

:error
echo Failed with error #%errorlevel%.
exit /b %errorlevel%
