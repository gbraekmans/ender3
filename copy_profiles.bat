@echo off
set PATH=C:\cygwin64\bin;%PATH%
SET pth=%~dp0

C:\cygwin64\bin\bash %pth%copy_profiles.sh "%USERPROFILE%"

pause