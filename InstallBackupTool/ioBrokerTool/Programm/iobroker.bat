@echo off
start Programm/putty.exe %BEN%@%IP% -pw %PSW%
echo    Wenn jetzt bei Putty etwas bestaetigt werden muss,
echo    unbedingt mit yes/ja bestaetigen.
echo    Ist Putty dann eingelogt, kann man Putty schliessen.
echo    Jetzt hier irgend eine Taste druecken zum installieren von iobroker.
pause


echo       Welche Node Version?
echo             =============
echo.	
echo   [1] Node 16
echo   [2] Node 18 (Standard)
echo   [3] Node 20
echo   [4] Beenden
echo.
set asw=0
set /p asw="Bitte Auswahl eingeben: "
if %asw%==1 goto NODE12
if %asw%==2 goto NODE14
if %asw%==3 goto NODE16
if %asw%==4 goto STOP
goto END
:NODE12
start restart.bat
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m iobrokerinstall12.txt
cd ..
exit
:NODE14
start restart.bat
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m iobrokerinstall14.txt
cd ..
exit
:NODE16
start restart.bat
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m iobrokerinstall16.txt
cd ..
exit
:STOP
start restart.bat
exit
:END
start image.bat
exit
