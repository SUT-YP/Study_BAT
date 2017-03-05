@echo off
echo This is the Class:Loop-FOR
echo.


::FOR %%variable IN (set) DO command [command-parameters]

::%%variable 指定一个单一字母表示可替换的参数
::(set) 一组相关文件or命令
::command 指定对每个文件执行的命令
::command-parameters 为特定命令指定参数或命令行开关

::FOR循环有4个可选参数 /d, /l, /r, /f


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::/D

::FOR /D %%variable IN (set) DO command [command-parameters]
::主要用于搜索,当set中含有通配符(?或*)时,只与目录名(文件夹)做匹配,而不与文件名匹配

::打印C:\下所有目录
echo ---All folders in C:\---
for /d %%i in (c:\*) do echo %%i
echo.

::打印当前目录下 只有1~3个字母的目录名
echo ---folders of 1 to 3 letters in localpath---
md aaa & md bbbb
for /d %%i in (???) do echo %%i
if exist aaa rd aaa
if exist bbbb rd bbbb
echo.
::知识点补充,*可匹配最多N个字符,?可匹配最多1个字符


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::/R

::FOR /R [[drive:]path] %%variable IN (set) DO command [command-parameters]
::这是 检查以[[drive:]path]为根的目录树,指向每个目录 的for语句,可以读取指定路径下的所有文件名字
::如果再/r后面没有指定目录,则使用当前目录
::如果集仅为一个单点(.)字符,则枚举该目录树(即递归便利列举该目录及其下面的所有子目录)

::打印C:\Windows\System32下的所有.exe文件名
::for /r C:\Windows\System32 %%i in (*.exe) do echo %%i

::打印当前目录下的所有.exe文件名
::for /r %%i in (*.exe) do echo %%i

::打印C:\Windows\System32下的所有cmd.exe文件路径和文件名(主要是为了查看路径)
::for /r C:\Windows\System32 %%i in (cmd.exe) do echo %%i


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::/L

::FOR /L %%variable IN (start,step,end) DO command [command-parameters]
::以增量形式循环,最简单的循环

echo.
pause
