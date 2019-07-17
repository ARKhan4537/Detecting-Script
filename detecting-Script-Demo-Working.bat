@echo Off
echo.
:start
Title Windows aver Service Running
SETLOCAL enableextensions
set "USBCounter=0"
for /F "tokens=2 delims==" %%G in ('
WMIC logicaldisk where "DriveType=2" get DeviceID /value 2^>NUL ^| find "="
') do for /F "tokens=*" %%i in ("%%G") do ( 

set /A "USBCounter+=1"
set Drive=%%i
)
if %USBCounter%==1 goto detect
ENDLOCAL
goto start
exit
:detect
echo.
echo.
echo Usb Detected Successfuly...!
echo.
echo.
pause
