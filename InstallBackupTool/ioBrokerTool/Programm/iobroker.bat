@echo off
start Programm/putty.exe %BEN%@%IP% -pw %PSW%
echo    Wenn jetzt bei Putty etwas bestaetigt werden muss,
echo    unbedingt mit yes/ja bestaetigen.
echo    Ist Putty dann eingelogt, kann man Putty schliessen.
echo    Jetzt hier irgend eine Taste druecken zum installieren von iobroker.
pause
start restart.bat
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m iobrokerinstall.txt
cd ..
exit

