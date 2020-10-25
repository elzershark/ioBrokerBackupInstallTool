@echo off
start /WAIT Programm/plink.exe %BEN%@%IP% -pw %PSW% -m Programm/backup.txt
start /WAIT Programm/pscp.exe -q -batch -pw %PSW% %BEN%@%IP%:/opt/iobroker/archive.tar.gz ./Backup
start /WAIT Programm/plink.exe %BEN%@%IP% -pw %PSW% -m Programm/rm.txt
FOR /F "tokens=1,2,3,4,5 delims=/. " %%a in ('date/T') do set CDATE=%%a%%b%%c%%d
cd Backup
set of=1
if exist %of%Backup%cdate%.tar.gz ( goto :loop
) else ( goto :rename )
:loop
set /a of=of+1
if exist %of%Backup%cdate%.tar.gz ( goto :loop
) else ( goto :rename )
:rename
ren archive.tar.gz %of%Backup%cdate%.tar.gz

exit

