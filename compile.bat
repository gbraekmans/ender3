@echo off
SET path=%~dp0
FOR %%f IN (%path%post_processors\*.py) DO (
    "C:\Program Files\Python37\Scripts\pyinstaller" -F --specpath "%path%post_processors" "%%f"
)
pause