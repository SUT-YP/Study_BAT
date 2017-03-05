@echo off
echo This is the Class:IF
echo.


::IF [NOT] ERRORLEVEL number command
::放在某一个命令的后面,执行命令后由IF ERRORLEVEL 来判断命令的返回值
::Number的数字取值范围0~255,判断时值的排列顺序应该由大到小.返回的值大于等于指定的值时,条件成立
echo.
IF ERRORLEVEL 1 goto 1
IF ERRORLEVEL 0 goto 0
:0
echo success
:1
echo failed
echo.


::IF [NOT] string1==string2 command


::IF [NOT] EXIST filename command
if exist fileExist.txt echo File named "fileExist.txt" is exist
echo.


echo.
pause
