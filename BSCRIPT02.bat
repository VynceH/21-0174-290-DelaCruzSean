@echo off
cls

:menu
echo.
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
echo 4. exit

set /p choice=Enter your choice (1-4): 

if "%choice%"=="4" goto end
if "%choice%"=="3" goto quad
if "%choice%"=="2" goto tri
if "%choice%"=="1" goto circ

:circ
set /p radius=Enter the radius of the circle: 
set /a area=3*%radius%*%radius%
echo The area of the circle is %area%
goto menu

:tri
    set /p side1=Enter the length of side 1: 
    set /p side2=Enter the length of side 2: 
    set /p side3=Enter the length of side 3: 

    rem Calculate the area using Heron's formula
    set /a s=(%side1%+%side2%+%side3%)/2
    set /a area=(s*(s-%side1%)*(s-%side2%)*(s-%side3%)) / 4
    echo The area of the triangle is %area%

    if %side1% equ %side2% (
        if %side1% equ %side3% (
            echo The triangle is equilateral.
        ) else (
            echo The triangle is isosceles.
        )
    ) else if %side1% equ %side3% (
        echo The triangle is isosceles.
    ) else if %side2% equ %side3% (
        echo The triangle is isosceles.
    ) else (
        echo The triangle is scalene.
    )
goto menu

:quad
    set /p length=Enter the length of the quadrilateral: 
    set /p width=Enter the width of the quadrilateral: 
    set /a area=%length%*%width%
    echo The area of the quadrilateral is %area%
    rem Determine if it is a square or rectangle
    if %length%==%width% (
        echo It is a square.
    ) else (
        echo It is a rectangle.
    )
goto menu

:end
echo Exiting...