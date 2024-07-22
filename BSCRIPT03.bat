@echo off
cls

:menu
echo.
echo Select a Windows utility to execute:
echo 1. ipconfig
echo 2. tasklist/taskkill
echo 3. chkdsk
echo 4. format
echo 5. defrag
echo 6. find
echo 7. attrib
echo 8. exit

set /p choice=Enter your choice (1-8): 

if "%choice%"=="8" goto end
if "%choice%"=="7" goto iattrib
if "%choice%"=="6" goto ifind
if "%choice%"=="5" goto idefrag
if "%choice%"=="4" goto iformat
if "%choice%"=="3" goto checkdisk
if "%choice%"=="2" goto tasklistkill
if "%choice%"=="1" goto iipconfig

:iipconfig
ipconfig
goto menu

:tasklistkill
set /p task_choice=Enter tasklist or taskkill: 
%task_choice%
goto menu

:checkdisk
chkdsk
goto menu

:iformat
set /p drive=Enter drive letter to format: 
format %drive%
goto menu

:idefrag
defrag -?
goto menu

:ifind
set /p search_term=Enter search term: 
find %search_term%
goto menu

:iattrib
set /p file=Enter file path: 
attrib %file%
goto menu

:end
echo Exiting...