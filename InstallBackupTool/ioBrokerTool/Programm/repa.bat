@echo off
echo.
echo.
echo                 Zugangsdaten
echo      ---------------------------------
echo              IP= %IP%
echo              Benutzername= %BEN%
echo              Passwort= %PSW% 
echo      =================================
echo.
echo.
echo       Reparatur/Upgrade ioBroker/Node
echo             =============
echo.	
echo   [1] ioBroker reparieren/NPM/Node/JS-Controller/Adapter Upgraden
echo   [2] Allgemeines Fix Script (sollte reichen)
echo   [3] NPM Adapter rebuild. Nach NPM Upgrade (1) ausfuehren
echo   [4] reinstall.sh script ausfuehren
echo   [5] PANIK REPARIEREN. LETZTE HOFFNUNG. Log gucken in Iobroker.
echo       Bleibt alles erhalten. Node Ordner wird geloescht. Dauert lange.
echo   [6] Putty starten
echo   [7] Beenden
echo.
set asw=0
set /p asw="Bitte Auswahl eingeben: "
if %asw%==1 goto NODE
if %asw%==2 goto AFIX
if %asw%==3 goto NPM
if %asw%==4 goto REINSTALL
if %asw%==5 goto ADAPTER
if %asw%==6 goto PUTTY
if %asw%==7 goto STOP
start repa.bat
exit
:NODE
echo       Welche Node Version?
echo             =============
echo.	
echo   [1] Node 12 
echo   [2] Node 14 (Standard)
echo   [3] Node 16
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
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m node12.txt
cd ..
goto END
:NODE14
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m node14.txt
cd ..
goto END
:NODE16
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m node16.txt
cd ..
goto END
:AFIX
cd Programm
START cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m afix.txt
cd ..
goto END
:NPM
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m npm.txt
cd ..
goto END
:REINSTALL
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m reinstall.txt
cd ..
goto END
:ADAPTER
echo       Welche Node Version?
echo             =============
echo.	
echo   [1] Node 12 
echo   [2] Node 14 (Standard)
echo   [3] Node 16
echo   [4] Beenden
echo.
set asw=0
set /p asw="Bitte Auswahl eingeben: "
if %asw%==1 goto ADAPTER12
if %asw%==2 goto ADAPTER14
if %asw%==3 goto ADAPTER16
if %asw%==4 goto STOP
goto END
:PUTTY
start putty.bat
goto END
:NODE12
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m node12.txt
cd ..
goto END
:NODE14
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m node14.txt
cd ..
goto END
:NODE16
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m node16.txt
cd ..
goto END
:ADAPTER12
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m adapter12.txt
cd ..
goto END
:ADAPTER14
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m adapter14.txt
cd ..
goto END
:ADAPTER16
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m adapter16.txt
cd ..
goto END
:END
start repa.bat
exit
:STOP
start restart.bat
exit
