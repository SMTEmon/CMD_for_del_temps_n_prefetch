@echo off
:: Check if the script has administrative privileges
NET SESSION >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    goto UACPrompt
) else (
    echo Running with administrative privileges.
)

:: 
cd /D %temp%
for /d %%D in (*) do rd /s /q "%%D"
del /f /q *.*
cd /D C:\Windows\Prefetch
del /f /q *.*
cd /D C:\Windows\Temp
del /f /q *.*
cd /D C:\Users\SMTEmon\AppData\Local\Temp
del /f /q *.*
goto :EOF

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\RunElevated.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\RunElevated.vbs"
"%temp%\RunElevated.vbs"
del /f /q "%temp%\RunElevated.vbs"
goto :EOF
