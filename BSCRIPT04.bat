@echo off
cls

REM Sort text files on Drive C: by date
echo Sorting text files on Drive C: by date...
for /f "delims=" %%a in ('dir /b /od "C:\*.txt"') do (
    echo %%a
)

REM Archive older files to a folder on Drive Z:
echo Archiving older files to a folder on Drive Z:...
mkdir "Z:\Archive"
for /f "delims=" %%b in ('dir /b /o-d "C:\*.txt"') do (
    copy "C:\%%b" "Z:\Archive"
)

REM Sort the archived files by size
echo Sorting the archived files by size...
for /f "delims=" %%c in ('dir /b /os "Z:\Archive\*.txt"') do (
    echo %%c
)

REM Prompt the user for permission to delete old, large files
set /p delete=Do you want to delete the old, large files? (Y/N): 
if /i "%delete%"=="Y" (
    del "Z:\Archive\*.txt"
    echo Old, large files deleted.
) else (
    echo No files were deleted.
)