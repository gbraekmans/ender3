@echo off
SET pth=%~dp0
@RD /Q /S "%pth%build"
@RD /Q /S "C:\Program Files\Slic3r PE\post_processors"
move "%pth%dist" "C:\Program Files\Slic3r PE\post_processors"
pause