@echo off
echo This is the Class:Loop-FOR
echo.


::FOR %%variable IN (set) DO command [command-parameters]

::%%variable 指定一个单一字母表示可替换的参数
::(set) 一组相关文件or命令
::command 指定对每个文件执行的命令
::command-parameters 为特定命令指定参数或命令行开关

::FOR循环有4个可选参数 /d, /r, /l, /f


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


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::/F

::FOR /F ["options"] %%variable IN (file-set) DO command [command-parameters]
::FOR /F ["options"] %%variable IN ("string") DO command [command-parameters]
::FOR /F ["options"] %%variable IN ('command') DO command [command-parameters]
::使用文件解析来处理命令输出,字符串及文件内容
::文件解析过程包括读取输出,字符串或文件内容,将其分成独立的文本行以及再将每行解析成零个或更多个令牌
::然后通过设置为令牌的迭代变量值,调用 for 循环, 默认情况下,/F 传递每个文件每一行的第一个空白分隔符号,跳过空行

::options包含一个或多个关键字
::	eol=c 指一个行注释字符的结尾(就一个),带有c的行被注释(读取时跳过)
::  skip=n 指在文件开始时忽略的行数
::  delims=xxx 分隔符集,读文件时,遇此集合中的任意一个符号都将被用来分割字符串.不设置时,默认为空格和跳格键
::  tokens=x,y,m-n 
::  usebackq 使用后引键
::           未使用参数usebackq时:file-set表示文件,不能有空格(操作文件);双引号表示字符串(操作字符串);单引号表示执行命令(操作一个命令)
::           使用参数usebackq时：file-set和"file-set"都表示文件(文件路径或名称含有空格时候就能用);单引号表示字符串;后引号表示命令

echo.
rem 首先建立临时文件test.txt
echo ;Not gonna read >test.txt
echo a1 a2 a3 a4 a5 a6 >>test.txt
echo b1,b2,b3,b4,b5,b6 >>test.txt
echo c1-c2-c3-c4-c5-c6 >>test.txt
for /F "eol=; tokens=1,3,* delims=,- " %%i in (test.txt) do echo %%i %%j %%k
echo.
::eol=; 分号开头的注释行
::tokens=1,3* 将 每行的第1段,第3段,和剩余字段 分别赋值给 %%i %%j %%k
::delims=,-  (减号后面有个空格)以逗号减号空格作为分隔符,空格必须放在最后

echo.
for /F "delims=" %%i in ('net user') do @echo %%i
echo.
::相当于使用命令net user(打印本机全部帐号名字),"delims="是为了不让空格作为分隔符(默认空格和跳格键均为分隔符)

echo.
pause
Del test.txt
