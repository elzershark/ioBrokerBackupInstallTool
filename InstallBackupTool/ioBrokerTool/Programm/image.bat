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
echo.
echo.
echo            INSTALLATION IOBROKER
echo      ---------------------------------
echo.
echo   [1] Image fuer Raspberry downloaden
echo   [2] Eine SD Karte loeschen
echo   [3] Image auf SD Karte installieren
echo   [4] Installieren von ioBroker
echo   !!!VOR der Installation 1x Putty testen ob verbunden wird!!!
echo.
echo   [5] Beenden
echo.
set abw=0
set /p abw="Bitte Auswahl eingeben: "
if %abw%==1 goto RAS3
if %abw%==2 goto DISK
if %abw%==3 goto INSTALL
if %abw%==4 goto IOBROKER
if %abw%==5 goto STOP1
goto STOP1
:RAS3
cd Programm/Torrent/
start aria2c.exe https://downloads.raspberrypi.org/raspbian_lite_latest.torrent --seed-time 0 --seed-ratio 0.0
cd ..
START "" "Torrent"
cd ..
goto END1
:DISK
start diskmgmt.msc
goto END1
:IOBROKER
start iobroker.bat
exit
:INSTALL
start install.bat
goto END1
:END1
start image.bat
exit
:STOP1
start restart.bat
exit
