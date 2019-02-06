@echo off
setlocal enableDelayedExpansion

Echo set proxy to all users
set regkey=Software\Microsoft\Windows\CurrentVersion\Internet Settings
set command="wmic useraccount get sid | findstr /v "Guest MSSQLSERVER Public User""
FOR /F %%A in ('%command%') DO (
reg add "HKEY_USERS\%%A\%regkey%" /f /v ProxyEnable /t REG_DWORD /d 0x1
reg add "HKEY_USERS\%%A\%regkey%" /f /v ProxyServer /t REG_SZ /d "your address proxy server:your port proxy server"
reg add "HKEY_USERS\%%A\%regkey%" /f /v MigrateProxy /t REG_DWORD /d 0x1
reg add "HKEY_USERS\%%A\%regkey%" /f /v ProxyOverride /t REG_SZ /d "url to exclude;<local>"

Echo Check proxy all Users
reg query "HKEY_USERS\%%A\%regkey%" /f ProxyEnable
reg query "HKEY_USERS\%%A\%regkey%" /f ProxyServer
reg query "HKEY_USERS\%%A\%regkey%" /f MigrateProxy
reg query "HKEY_USERS\%%A\%regkey%" /f ProxyOverride

rem Echo delete proxy all Users
rem reg delete "HKEY_USERS\SID"
)
