@echo off &setlocal
set "search=set IP=%IP%"
set "replace=set IP=xxxxxx"
set "textfile=los.bat"
set "newfile=Output.txt"
call repl.bat "%search%" "%replace%" L < "%textfile%" >"%newfile%"
del "%textfile%"
rename "%newfile%" "%textfile%"

set "search=set BEN=%BEN%"
set "replace=set BEN=xxxxxx"
set "textfile=los.bat"
set "newfile=Output.txt"
call repl.bat "%search%" "%replace%" L < "%textfile%" >"%newfile%"
del "%textfile%"
rename "%newfile%" "%textfile%"

set "search=set PSW=%PSW%"
set "replace=set PSW=xxxxxx"
set "textfile=los.bat"
set "newfile=Output.txt"
call repl.bat "%search%" "%replace%" L < "%textfile%" >"%newfile%"
del "%textfile%"
rename "%newfile%" "%textfile%"

echo.
echo.
echo                 Zugangsdaten
echo      ---------------------------------
echo.
echo.
echo.
set /p IP="Die IP vom Raspberry eingeben: "
set /p BEN="Den Benutzernamen vom Raspberry eingeben: "
set /p PSW="Das Passwort vom Raspberry eingeben: "

set "search=set IP=xxxxxx"
set "replace=set IP=%IP%"
set "textfile=los.bat"
set "newfile=Output.txt"
call repl.bat "%search%" "%replace%" L < "%textfile%" >"%newfile%"
del "%textfile%"
rename "%newfile%" "%textfile%"

set "search=set BEN=xxxxxx"
set "replace=set BEN=%BEN%"
set "textfile=los.bat"
set "newfile=Output.txt"
call repl.bat "%search%" "%replace%" L < "%textfile%" >"%newfile%"
del "%textfile%"
rename "%newfile%" "%textfile%"

set "search=set PSW=xxxxxx"
set "replace=set PSW=%PSW%"
set "textfile=los.bat"
set "newfile=Output.txt"
call repl.bat "%search%" "%replace%" L < "%textfile%" >"%newfile%"
del "%textfile%"
rename "%newfile%" "%textfile%"

echo    Zum Beenden:
pause
start los.bat
exit
