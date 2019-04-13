@echo off
SET pth=%~dp0
FOR %%f IN (%path%post_processors\*.py) DO (
    "C:\Program Files\Python37\Scripts\pyinstaller" -F --specpath "%pth%post_processors" "%%f"
)
pause