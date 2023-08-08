@echo off
color 04
REM Batch file needs to be run as administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :continue
) else (
    echo You must run this script as an administrator.
    pause
    exit /b
)

:continue
REM Rest of your batch script goes here




@echo off
color 0a
setlocal enabledelayedexpansion

set "URL=https://pastebin.com/raw/fCn2nBeg"

for /f "usebackq delims=" %%a in (`curl %URL% 2^>nul`) do (
    set "line=%%a"
    for /f "tokens=1,2 delims==" %%b in ("!line!") do (
        if "%%b"=="name" set "vpnName=%%c"
        if "%%b"=="host" set "host=%%c"
        if "%%b"=="port" set "port=%%c"
        if "%%b"=="user" set "user=%%c"
        if "%%b"=="password" set "password=%%c"
    )
)

echo Creating VPN connection...
powershell.exe -Command "Add-VpnConnection -Name '!vpnName!' -ServerAddress '!host!:!port!' -TunnelType 'Sstp' -EncryptionLevel 'Required' -AllUserConnection"
echo Connecting to VPN...
cls
rasdial "!vpnName!" !user! !password!

echo ---------------------------------------------------
echo .............Coded By Yousef Elrashidy.............
echo ---------------------------------------------------

color 1
curl https://pastebin.com/raw/V0Prawv6

pause > nul
