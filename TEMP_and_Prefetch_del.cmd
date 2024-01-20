@echo off
cd /D %temp%
for /d %%D in (*) do rd /s /q "%%D"
del /f /q *.*
cd /D C:\Windows\Prefetch
del /f /q *.*
cd /D C:\Windows\Temp
del /f /q *.*
cd /D C:\Users\SMTEmon\AppData\Local\Temp
del /f /q *.*
