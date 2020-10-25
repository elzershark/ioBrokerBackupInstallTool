@echo off
set IP=raspberrypi
set BEN=pi
set PSW=raspberry
cd Programm
wget -t X, --tries=2 elzershark.com/Datei.txt 2>nul
echo.
echo.
echo                Internet Version:

type Datei.txt 2>nul
del Datei.txt 2>nul
cd ..
echo.
echo        Wenn abweicht, gibt es ein Upgrade
echo.
echo                 Deine Version:
type Version.txt 2>nul
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
echo   [ ] Mit den oberen Zugangsdaten einfach Enter druecken
echo   [1] Zugangsdaten kurzzeitig bis Neustart aendern
echo   [2] Die oben angezeigen Zugangsdaten dauerhaft aendern
echo   [3] Neue Version des Tool automatisch downloaden. 
echo       "Dateien im Ziel ersetzen" anklicken
echo   [4] Verknuepfung Desktop erstellen
echo.
set asw=0
set /p asw="Bitte Auswahl eingeben: "
if %asw%==1 goto MIT
if %asw%==2 goto AENDERN
if %asw%==3 goto LOAD
if %asw%==4 goto LINK
start restart.bat
exit
:MIT
echo.
echo.
set /p IP="Die IP vom Raspberry eingeben: "
set /p BEN="Den Benutzernamen vom Raspberry eingeben: "
set /p PSW="Das Passwort vom Raspberry eingeben: "
start restart.bat
exit
:LINK
xxmklink "%USERPROFILE%\Desktop\ioBroker Tool.lnk" "%cd%\los.bat" ""  "%cd%" "" "" "%cd%\start.ico"
start los.bat
exit
:AENDERN
start aendern.bat
exit
:LOAD
start download.bat
exit
