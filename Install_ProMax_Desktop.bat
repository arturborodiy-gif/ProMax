@echo off
setlocal
set "APPURL=https://arturborodiy-gif.github.io/ProMax/"
set "APPDIR=%LOCALAPPDATA%\ProMax"
if not exist "%APPDIR%" mkdir "%APPDIR%"
copy /Y "%~dp0ProMax.ico" "%APPDIR%\ProMax.ico" >nul
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$desktop=[Environment]::GetFolderPath('Desktop'); $lnk=Join-Path $desktop 'ProMax.lnk'; $ws=New-Object -ComObject WScript.Shell; $s=$ws.CreateShortcut($lnk); $s.TargetPath='https://arturborodiy-gif.github.io/ProMax/'; $s.IconLocation=(Join-Path $env:LOCALAPPDATA 'ProMax\ProMax.ico'); $s.Description='ProMax'; $s.Save(); if(Test-Path $lnk){ Start-Process $lnk } else { exit 1 }"
if errorlevel 1 (echo FAILED&pause&exit /b 1)
echo ProMax shortcut created.
timeout /t 2 >nul
endlocal
