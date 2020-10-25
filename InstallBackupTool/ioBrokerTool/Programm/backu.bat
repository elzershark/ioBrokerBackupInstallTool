@echo off &setlocal
echo                     USB- Laufwerk am Raspberry installieren
echo                        ---------------------------------
echo.
echo  !!! ACHTUNG !!! Nach der Installation[1] wird der Raspi neu gestartet (sudo reboot) !!!
echo           Meldung = FATAL ERROR: ist normal. Wegen reboot kappt die Verbindung
echo.
echo       !!!Der USB-Stick muss mit FAT-32 oder exFAT formatiert sein/werden !!!
echo.
echo   !!! Der USB-Stick muss nach jedem entfernen vom Raspy neu gemountet werden [5] !!!
echo.
echo  !!! USB Stick kann nur gemountet werden wenn der Ordner /mount/usbstick leer ist!!!
echo        (USB-Stick entfernen und mit Putty "dir /media/usbstick" nachschauen)
echo.
echo            !!! USB Backups aelter als 7 Tage werden geloescht !!!
echo    !!! USB Backups ohne USB-Stick werden auch unter /media/usbstick gespeichert!!!
echo   !!! Das mounten eines USB-Sticks ist dann erst wieder moeglich.... siehe oben!!!
echo.
echo			[1] USB Software installieren Starten?
echo			[2] USB-Stick Einrichten
echo			[3] Ich muss noch formatieren
echo   -----------------------------------------------------------------
echo			[4] USB Mount Kontrolle
echo			[5] USB Aktivieren
echo			[6] USB Auswerfen
echo			[7] USB Backup erstellen
echo			[8] Mit USB Backup ioBroker zuruecksetzen
echo			[9] Beenden
echo.
set asw=0
set /p asw="         Bitte Auswahl eingeben: "
if %asw%==1 goto MIT
if %asw%==2 goto EINR
if %asw%==3 goto AENDERN
if %asw%==4 goto KONTROL
if %asw%==5 goto USB
if %asw%==6 goto USBU
if %asw%==7 goto USBBACK
if %asw%==8 goto USBRET
if %asw%==9 goto BEEN
start restart.bat
exit
:MIT
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m backupusb.txt
cd ..
start backu.bat
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
echo crontab -l ^| sed -e '/sudo mount -t/d' ^| crontab; ^(crontab ^-l ^&^& echo "@reboot sudo mount -t %vat% -o utf8,uid=pi,gid=pi,noatime /dev/%num% /media/usbstick") ^| crontab -; sudo mount -t %vat% -o utf8,uid=pi,gid=pi,noatime /dev/%num% /media/usbstick>Programm/usb.txt

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
start /WAIT Programm/plink.exe %BEN%@%IP% -pw %PSW% -m Programm/usbret.txt
start backu.bat
exit
:BEEN
start restart.bat
exit