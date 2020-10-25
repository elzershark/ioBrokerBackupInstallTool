@echo off
echo.
echo.
echo            	Raspberry + ioBroker Installieren:
echo            	==================================
echo			 !!!Alle Daten werden geloescht!!!
echo.
echo 	[1] Stecke eine Leere SD Karte ins Lesegeraet.
echo.
echo 	[2] Waehle im Win32DiskImager dein Image aus fuer den Raspberry.
echo.
echo 	[3] Waehle im Win32DiskImager rechts bei Device das Laufwerk der SD Karte.
echo.
echo 	[4] Klicke unten auf Write und warte bis das Programm fertig ist.
echo.
echo 	[5] Oeffne das Laufwerk "Boot" und kopiere die beiden Dateien ssh u. wpa_supplicant.conf rein.
echo.
echo 	[6] Stecke die SD-Karte in den Raspi und starte Ihn.
echo.
echo 	[7] Gebe im Browser die Raspi IP ein mit :8081 Probiere raspberrypi:8081
echo.
echo.
echo.
start Programm/DiskImager/Win32DiskImager.exe
echo    Zum Beenden:
pause
exit