@echo off
::
:: Working 100% Try it
:: A Technique For Auto Transfer Pictures/File From one Directory to another Directory Of Server /Network shareing files And Rename Images
:: by Time that Getting Form Server. 
Title FileMove
setlocal enableDelayedExpansion
md %systemdrive%\script
echo 1 >%systemdrive%\script\counter.txt
cls
echo.
set /p st=Enter Shifting start Path:
echo.
set /p st1=Enter Shifting Ending Path:
:Loop

dir /s /b "%st%" >%systemdrive%\script\print.txt

::ping www.facebook.com >nul

for /f "tokens=1-5 delims=:" %%d in ("%time%") do (
set num=%%d-%%e-%%f
)


set /a count=0
for /F "tokens=*" %%A in (%systemdrive%\script\print.txt) do (
set /a count+=1
set File[!count!]=%%A
)

set /a count=0
:repeat
find /c "!count!" %systemdrive%\script\counter.txt && goto process
set /a count+=1
goto repeat

:process
for /F "tokens=2 delims==" %%s in ('set File[!count!]') do ren "%%s" "%num%.jpg"
move "%st%\%num%.jpg" %st1%

set /a count+=1
echo !count! >%systemdrive%\script\counter.txt
goto Loop
