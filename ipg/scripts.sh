#
#Variablen
#H = 40
#B = 80
#
#Funktionen
#function show_OA{ }
#
#Hauptmenu
#HM = -1
#do
#	dialog --menu "Herzlich Willkommen. Bitte wählen Sie eine Option:" 40 80 4 HM=? \
#case $HM in
#OA "Neue Ordner anlegen" \
#DA "Neue Dateien anlegen" \
#BZ "Berechtigungen zuweisen" \
#UV "Neues Unterrichtsmaterial verbinden" 2>"${INPUT}"
#
#case $HM in
#OA)
#	dialog --msgbox "Hallo" 6 35
#DA)
#	dialog --msgbox "nein, nein" 6 35
#esac
#menuitem = $(<"${INPUT}">)
#
#case $menuitem in
#OA) show_OA;;
#DA) show_DA;;
#BZ) show_BZ;;
#UV) show_UV;;
#esac

#Hauptmenu
echo "Herzlich Willkommen. Bitte wählen Sie eine Option:"
echo "1 Neuen Ordner anlegen"
echo "2 Neue Datei anlegen"
echo "3 Berechtigungen zuweisen"
echo "4 Neues Unterrichtsmaterial verbinden"

read NR

#Ausführen nach Auswahl
case $NR in

#Neuen Ordner anlegen
"1")
	echo -n "Geben Sie den Namen des neuen Ordners ein: "
	read NAME
	mkdir ${NAME}
	echo "Der Ordner "${NAME}" wurde erfolgreich unter "${PWD}" angelegt."
	;;

#Neue Datei anlegen
"2")
	echo -n "Geben Sie den Namen der neuen Datei ein: "
	read NAME
	touch ${NAME}.txt
	echo "Die Textdatei "${NAME}" wurde erfolgreich unter "${PWD}" angelegt."
	;;

#Berechtigungen zuweisen
"3")
	echo "Bei welcher Datei wollen Sie die Berechtigungen anpassen?"
	BER = ls -l ${PWD}
	read NAME
	BER = ls -l ${NAME}
	echo "Aktuelle Berechtigungen: "$BER
	echo "Für wen wollen Sie die Berechtigungen angepassen?"
	echo "1) Gruppe"
	echo "2) Rest"
	read WER
	echo "Was soll angepasst werden?"
	echo "1) lesen"
	echo "2) schreiben"
	echo "3) ausführen"
	read WAS

	case WER in
		"1") WER = "g";;
		"2") WER = "o";;
	esac

	case WAS in
		"1") WAS = "r";;
		"2") WAS = "w";;
		"3") WAS = "X";;
	esac





	echo "Die Berechtigungen von "${NAME}" wurden erfolgreich angepasst: "
	echo $BER
	;;

#Neues Unterrichtsmaterial verbinden
"4")
	echo "Hi"
	;;
esac
