@echo off &setlocal
echo                     USB- Laufwerk am Raspberry installieren
echo                        ---------------------------------
echo.
echo       !!!Der USB-Stick muss mit FAT-32 oder exFAT formatiert sein/werden !!!
echo.
echo   !!! Der USB-Stick muss nach jedem manuellem entfernen vom Raspy neu gemountet werden [4] !!!
echo   !!! Oder der Raspberry muss MIT USB-Stick neu gestartet werden. !!!
echo   !!! Nach jedem Neustart des Raspberry mountet der USB Stick automatisch !!!
echo.
echo            !!! USB Backups aelter als 7 Tage werden automatisch geloescht !!!
echo    !!! USB Backups ohne USB-Stick werden auch unter /media/usbstick gespeichert!!!
echo   !!! laesst der USB Stick sich nicht mounten, Raspberry mit USB-Stick neu starten!!!
echo.
echo			[1] USB-Stick Einrichten
echo			[2] Ich muss noch formatieren
echo   -----------------------------------------------------------------
echo			[3] USB Mount Kontrolle u. Ordner erstellen auf Raspi / Stick
echo			[4] USB Aktivieren
echo			[5] USB Auswerfen
echo			[6] Backup erstellen
echo			[7] Backup zuruecksetzen (BACKUP MUSS VORHANDEN SEIN)
echo			[8] Beenden
echo.
set asw=0
set /p asw="         Bitte Auswahl eingeben: "
if %asw%==1 goto EINR
if %asw%==2 goto AENDERN
if %asw%==3 goto KONTROL
if %asw%==4 goto USB
if %asw%==5 goto USBU
if %asw%==6 goto USBBACK
if %asw%==7 goto USBRET
if %asw%==8 goto BEEN
start restart.bat
exit
:EINR
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m kontrol.txt
cd ..
echo.
echo.
echo.
echo                               Die USB Mount Kontrolle ist gestartet
echo                                ---------------------------------
echo  Im offenen Fenster, schauen wo [not mounted] steht, sich merken wie der Zugriffspunkt heisst
echo                               sda1 oder sda2 oder sdb1 oder... das merken.
echo                                ---------------------------------
echo          Bei sda* oder sdb*, oder ..., daneben gucken ob "exfat" oder "vfat" steht.
echo                                ---------------------------------
echo        Sollte /dev/sda* oder sdb*, ..., nicht existieren bitte Raspberry neu starten.
echo           Dann dieses Programm beenden und diesen Vorgang hier Wiederholen.
echo                                ---------------------------------
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
pause
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo                              ---------------------------------
echo.
set numa=1
set vat=exfat
set /p num="                          Bitte eintippen wie der USB-Pfad heisst. (ohne/dev/)z.B. sda1 oder sdb1 oder...: "
set /p vat="                          Bitte exfat oder vfat eingeben: "
echo.
echo.
echo crontab -l ^| sed -e '/sudo mount -t/d' ^| crontab; ^(crontab ^-l ^&^& echo "@reboot sudo mount -t %vat% -o utf8,uid=iobroker,gid=iobroker,noatime /dev/%num% /media/usbstick") ^| crontab -; sudo mount -t %vat% -o utf8,uid=iobroker,gid=iobroker,noatime /dev/%num% /media/usbstick; sudo mkdir /media; sudo mkdir /media/usbstick; sudo chown -R iobroker /media/usbstick>Programm/usb.txt

start /WAIT Programm/plink.exe %BEN%@%IP% -pw %PSW% -m Programm/usb.txt
start backu.bat
exit
:AENDERN
start diskmgmt.msc
start backu.bat
exit
:USBU
start /WAIT Programm/plink.exe %BEN%@%IP% -pw %PSW% -m Programm/unmount.txt
start backu.bat
exit
:USB
start /WAIT Programm/plink.exe %BEN%@%IP% -pw %PSW% -m Programm/usb.txt
start backu.bat
exit
:KONTROL
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m kontrol.txt
cd ..
start backu.bat
exit
:USBBACK
start /WAIT Programm/plink.exe %BEN%@%IP% -pw %PSW% -m Programm/usbback.txt
start backu.bat
exit
:USBRET
echo.
echo.
echo                 Das zuruecksetzen wirklich ausfuehren?
echo                 Es muss ein Backup vorhanden sein.
echo                 Sonst wird IoBroker nicht mehr funktionieren.
echo                 Im neuen Fenster werden die Backups angezeigt.
echo                 Sind dort keine, unbedingt Abbrechen.
echo.
echo.
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m list.txt
cd ..
echo.	
echo   [1] Weiter
echo   [2] Abbrechen
echo.
set asw=0
set /p asw="Bitte Auswahl eingeben: "
if %asw%==1 goto WEITER
if %asw%==2 goto END
goto END
:WEITER
start /WAIT Programm/plink.exe %BEN%@%IP% -pw %PSW% -m Programm/usbret.txt
start backu.bat
exit
:END
start backu.bat
exit
:BEEN
start restart.bat
exit
