@echo off
SET path=%~dp0
@RD /Q /S "%path%build"
@RD /Q /S "C:\Program Files\Slic3r PE\post_processors"
move "%path%dist" "C:\Program Files\Slic3r PE\post_processors"
pause