@echo off
goto END1
:END1
cls
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
echo    Auf der Webseite das Tool runterladen und starten.
echo    OS waehlen klicken und runter auf loeschen. Danach:
echo    OS waehlen klicken,
echo    Raspberry PI OS (other) - "lite" klicken.
echo    Nach Installation der SD Karte (oder USB-Stick) die Dateien SSH und
echo    falls Wlan, die Datei wpa_supplicant.(conf) bearbeiten
echo    und in die SD Karte (boot) reinkopieren.
echo    Raspberry starten mit der SD-Karte oder USB Stick
echo    Das Tool hier neu starten und die Daten fuer den Raspi
echo    eingeben (IP - Benutzer - Passwort)
echo    Standard: Benutzer= pi PW= raspberry
echo    2 zum installieren von IoBroker eingeben.
echo.
echo      ---------------------------------
pause
cls
echo                 Zugangsdaten
echo      ---------------------------------
echo              IP= %IP%
echo              Benutzername= %BEN%
echo              Passwort= %PSW% 
echo      =================================
echo.
echo   [1] Image fuer Raspberry downloaden
echo   [2] Installieren von ioBroker
echo   !!!LESEN was dann da steht im Fenster!!!
echo.
echo   [3] Beenden
echo.
set abw=0
set /p abw="Bitte Auswahl eingeben: "
if %abw%==1 goto RAS3
if %abw%==2 goto IOBROKER
if %abw%==3 goto STOP1
goto STOP1
:RAS3
IF exist "%ProgramFiles(x86)%\Raspberry Pi Imager\rpi-imager.exe" (
    start rpi-imager.exe
) ELSE (IF exist "%ProgramFiles%\Raspberry Pi Imager\rpi-imager.exe" (
    start rpi-imager.exe
) ELSE (start https://www.raspberrypi.org/software/
)
)
cd Programm/Torrent/
cd ..
START "" "Torrent"
cd ..
goto END1
:RAStest
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
:STOP1
start restart.bat
exit
