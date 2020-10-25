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
echo                        Software
echo      ----------------------------------------
echo.
echo   [1] Wlan IP Adressen aller Geraete anzeigen
echo   [2] Dateien auf/aus den Raspberry laden
echo.
set asw=0
set /p asw="Bitte Auswahl eingeben: "
if %asw%==1 goto MIT
if %asw%==2 goto AENDERN
start restart.bat
exit
:MIT
start Programm/Wlan/Wlan.exe
start wlan.bat
exit
:AENDERN
start Programm/WinSCP/WinSCP.exe
start wlan.bat
exit