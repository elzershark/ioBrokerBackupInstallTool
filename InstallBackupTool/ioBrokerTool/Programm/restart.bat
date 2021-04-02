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
echo             Backup-Skript
echo             =============
echo.	
echo   [1] Backup erstellen
echo   [2] Backup zuruecksetzen (BACKUP MUSS VORHANDEN SEIN)
echo   [3] ioBroker reparieren/upgraden
echo   [4] Putty oeffnen
echo   [5] Backup Order anzeigen
echo   [6] Download Image und Installation ioBroker
echo   [7] Software W-Lan / Data- Transfer
echo   [8] Menue Backup direkt auf Raspberry und/oder USB
echo   [9] Beenden
echo.
set asw=0
set /p asw="Bitte Auswahl eingeben: "
if %asw%==1 goto FILES
if %asw%==2 goto HP
if %asw%==3 goto REPA
if %asw%==4 goto PUTTY
if %asw%==5 goto OPEN
if %asw%==6 goto DOWN
if %asw%==7 goto WLAN
if %asw%==8 goto BACKU
if %asw%==9 goto STOP
start restart.bat
exit
goto END
:FILES
start erstellen.bat
goto END
:REPA
start repa.bat
goto STOP
:HP
start setzen.bat
goto END
:OPEN
START "" "Backup"
goto END
:WLAN
start wlan.bat
goto STOP
:BACKU
start backu.bat
goto STOP
:PUTTY
start putty.bat
goto END
:DOWN
start image.bat
goto STOP
:END
start restart.bat
:STOP
exit
