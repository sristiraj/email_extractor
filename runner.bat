@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set INPUT_FILE=email.csv
set OUTPUT_FILE=emails.txt
set "REGEXP=[\.A-Z\-_][\.A-Z\-_]*@[\.A-Z\-_][\.A-Z\-_]*"
>nul copy nul %OUTPUT_FILE%
for /f "tokens=*" %%a in (%INPUT_FILE%) do (
    set y=%%a
    for %%b in (%%a) do (
        set x=!y!
        set k= !x:~0,1!
        for /f %%z in ('echo %%b ^| findstr /R /I "%REGEXP%"') do (
            set "ln=!k!"
            set "ln=!ln!,%%z"
            echo !ln! >> %OUTPUT_FILE%
        )
    ) 
)
