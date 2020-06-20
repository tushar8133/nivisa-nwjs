@ECHO off
cls
:start
ECHO.
ECHO **** IMPORTANT PLEASE RUN AS ADMINISTRATOR ****
ECHO 1. SET IP ADDRESS 10.0.0.20
ECHO 2. SET IP ADDRESS 10.0.0.30
ECHO 3. ECHO SET IP ADDRESS 192.168.0.10
ECHO 4. Obtain an IP address automatically
ECHO 5. Exit
set choice=
set /p choice=Type the number to print text.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto con1
if '%choice%'=='2' goto con2
if '%choice%'=='3' goto con3
if '%choice%'=='4' goto autosearch
if '%choice%'=='5' goto end
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:con1
ECHO DONE IP ADDRESS 10.0.0.20
netsh interface ip set address "Ethernet" static 10.0.0.20 255.255.255.0 0.0.0.0 1
goto end

:con2
ECHO DONE IP ADDRESS 10.0.0.30
netsh interface ip set address "Ethernet" static 10.0.0.30 255.255.255.0 0.0.0.0 1
goto end

:con3
ECHO ECHO DONE IP ADDRESS 192.168.0.10
netsh interface ip set address "Ethernet" static 192.168.0.10 255.255.255.0 192.168.0.1 1
goto end

:autosearch
ECHO obtaining auto IP
ipconfig /renew "Local Area Connection"
goto end

:bye
ECHO BYE
goto end

:end