#!bin/bash

clear
echo
echo "                           _____           _       _   _       _   _                  "
echo "                          |_   _|         | |     (_) | |     (_) | |                 "
echo "                            | |    _ __   | |__    _  | |__    _  | |_    ___    _ __ "
echo "                            | |   | '_ \  | '_ \  | | | '_ \  | | | __|  / _ \  | '__|"
echo "                           _| |_  | | | | | | | | | | | |_) | | | | |_  | (_) | | |   "
echo "                          |_____| |_| |_| |_| |_| |_| |_.__/  |_|  \__|  \___/  |_|   " 
echo "                              __________________________________________________"					
echo "                                ︻デ═一  Created by: XDeadHackerX v1.2  ︻デ═一 " 
echo "          -------------------------------------------------------------------------------------------"
echo "          Cualquier acción y o actividad relacionada con Inhibitor es únicamente su responsabilidad"
echo "          -------------------------------------------------------------------------------------------"
echo
echo
echo "[2] Escaner avanzado Redes Wifi"
echo 
sudo airmon-ng
echo
read -p "[*] Escribe la Interfaz de la Tarjeta de Red (Ej: wlan0): " interfaz
read -p "[*] Cortar la salida a internet para evitar futuros errores? (y/n): " opc1
echo
if [ $opc1 = y ]
	then
		sudo airmon-ng check kill
	else
		echo "OK"
fi
echo
echo "======================="
echo "Activando Modo Monitor"
echo "======================="
echo "--->""                  |"
sleep 1
echo "-------->""             |"
sleep 1
echo "--------------->""      |"
sleep 1
echo "--------------------->""|"
echo "======================="
sudo ifconfig $interfaz promisc
sudo airmon-ng start $interfaz
echo
read -p "[*] Escribe la Interfaz de la Tarjeta de Red en modo Monitor (Ej: wlan0mon o wlan0): " interfaz2
echo
echo "======================="
echo " Activando Modo Seguro"
echo "======================="
echo "--->""                  |"
sleep 1
echo "-------->""             |"
sleep 1
echo "--------------->""      |"
sleep 1
echo "--------------------->""|"
echo "======================="
echo
sudo ifconfig $interfaz2 promisc
sudo ifconfig $interfaz2 down
sudo macchanger -a $interfaz2
sudo ifconfig $interfaz2 up
sleep 2
sudo airodump-ng $interfaz2 --band abg
echo
echo "=============================="
echo "        Desactivando"
echo "Ataque/Modo Monitor/Seguridad"
echo "=============================="
echo "-------->""                    |"
sleep 1
echo "--------------->""             |"
sleep 1
echo "---------------------->""      |"
sleep 1
echo "---------------------------->""|"
echo "=============================="
echo
sudo ifconfig $interfaz2 down
sudo macchanger -p $interfaz2
sudo ifconfig $interfaz2 up
sleep 2
sudo ifconfig $interfaz2 -promisc
sudo airmon-ng stop $interfaz2
sudo ifconfig $interfaz -promisc
sudo systemctl restart NetworkManager.service
sleep 1
echo
echo
echo "#####################"
echo "[1] Volver al Menu"
echo "[2] Volver a ejecutar"
echo "[3] Salir"
echo "#####################"
echo
read -p "Elige una opcion: " opc2
	case $opc2 in
			1 )	bash inhibitor.sh
				;;
			2 )	bash requisitos/2.sh
				;;
			3 )	exit && clear
				;;
			* )	echo
				echo "$RRPLY No es una opcion valida"
	esac
