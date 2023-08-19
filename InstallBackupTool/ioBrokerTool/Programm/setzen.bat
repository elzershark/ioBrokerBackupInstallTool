@echo off
goto END
:END
cls
setlocal enabledelayedexpansion
set zaehler=0
for %%a in ("%cd%\Backup\*.gz") do (
set /a zaehler=!zaehler!+1
set auswahl_!zaehler!=%%~nxa
echo "(!zaehler!) %%~nxta"
)
set /p choice=Auswahl: 
echo !auswahl_%choice%!
set awo=0
set /p awo="Dieses Backup nehmen?: j/n "
if %awo%==j goto ENDE
if %awo%==ja goto ENDE
if %awo%==y goto ENDE
if %awo%==yes goto ENDE
goto END
:ENDE
@echo off &setlocal
pushd "Backup" ||goto :eof
copy "!auswahl_%choice%!" "archive.tar.gz"
popd
start /WAIT Programm/plink.exe %BEN%@%IP% -pw %PSW% -m Programm/iobrokerstop.txt
start /WAIT Programm/pscp.exe -q -batch -pw %PSW% Backup/archive.tar.gz %BEN%@%IP%:/opt/iobroker/
start /WAIT Programm/plink.exe %BEN%@%IP% -pw %PSW% -m Programm/reset.txt
cd Backup
del archive.tar.gz
exit