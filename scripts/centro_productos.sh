#!/bin/bash

show_status() {
	if [ $? -eq 0 ]; then
    	echo "Operación realizada con éxito."
	else
    	echo "Hubo un error al realizar la operación."
	fi
	read -p "Presione Enter para continuar..."
}

main() {
	while true; do
    	clear
    	echo "=============================="
    	echo " Bienvenido al menú principal de SIGTO"
    	echo "=============================="
    	echo "1. Altas, bajas, modificaciones y logs"
    	echo "2. Puertos"
    	echo "0. Salir"
    	echo "=============================="
    	read -p "Ingrese una opción: " op1

    	case $op1 in
        	1)
            	clear
            	menuABML
            	;;
        	2)
            	clear
            	menuPuertos
            	;;
        	0)
            	echo "Chau"
            	exit
            	;;
        	*)
            	echo "Opción incorrecta"
            	show_status
            	;;
    	esac
	done
}

menuABML() {
	while true; do
    	clear
    	echo "=============================="
    	echo " Menú A.B.M y LOGS - Gestión SIGTO"
    	echo "=============================="
    	echo "1. A. B. M. - Usuario"
    	echo "2. A. B. M. - Grupo"
    	echo "3. Logs"
    	echo "0. Salir"
    	echo "=============================="
    	read -p "Ingrese una opción: " op2

    	case $op2 in
        	1)
            	manage_users
            	;;
        	2)
            	manage_groups
            	;;
        	3)
            	manage_logs
            	;;
        	0)
            	break
            	;;
        	*)
            	echo "Opción incorrecta"
            	show_status
            	;;
    	esac
	done
}

manage_users() {
	while true; do
    	clear
    	echo "=============================="
    	echo " A. B. M. - Usuarios"
    	echo "=============================="
    	echo "1. Alta"
    	echo "2. Baja"
    	echo "3. Modificaciones"
    	echo "0. Salir"
    	echo "=============================="
    	read -p "Ingrese una opción: " opcionABMUser

    	case $opcionABMUser in
        	1)
            	read -p "Ingrese un nombre de usuario: " nombre
            	read -p "¿Quiere dejar la configuración por defecto? [s/n]: " pregunta
            	if [[ $pregunta == 's' ]]; then
                	sudo adduser -D $nombre
            	else
                	sudo adduser $nombre
            	fi
            	show_status
            	;;
        	2)
            	read -p "Ingrese un nombre de usuario: " nombre
            	sudo deluser -f $nombre
            	show_status
            	;;
        	3)
            	read -p "Ingrese un nombre de usuario: " nombre
            	echo "Modificaciones - Usuarios"
            	sudo passwd $nombre
            	show_status
            	;;
        	0)
            	break
            	;;
        	*)
            	echo "Opción incorrecta"
            	show_status
            	;;
    	esac
	done
}

manage_groups() {
	while true; do
    	clear
    	echo "=============================="
    	echo " A. B. M. - Grupos"
    	echo "=============================="
    	echo "1. Alta"
    	echo "2. Baja"
    	echo "3. Modificaciones"
    	echo "0. Salir"
    	echo "=============================="
    	read -p "Ingrese una opción: " opABMGrupo

    	case $opABMGrupo in
        	1)
            	read -p "Ingrese el nombre del grupo: " grupo
            	sudo addgroup $grupo
            	show_status
            	;;
        	2)
            	read -p "Ingrese el nombre del grupo: " grupo
            	sudo delgroup $grupo
            	show_status
            	;;
        	3)
            	read -p "Ingrese el nombre del grupo a modificar: " grupo
            	read -p "Ingrese el nuevo nombre del grupo: " nuevo_grupo
            	sudo groupmod -n $nuevo_grupo $grupo
            	show_status
            	;;
        	0)
            	break
            	;;
        	*)
            	echo "Opción incorrecta"
            	show_status
            	;;
    	esac
	done
}

manage_logs() {
	while true; do
    	clear
    	echo "=============================="
    	echo " Menú LOGS"
    	echo "=============================="
    	echo "1. Mostrar en un rango de fecha"
    	echo "2. ¿Qué hizo qué usuario?"
    	echo "3. Mostrar logs apache"
    	echo "4. Mostrar mensajes de seguridad"
      echo "5. Ir al script de logs"
    	echo "0. Salir"
    	echo "=============================="
    	read -p "Ingrese una opción: " op3

    	case $op3 in
        	1)
            	read -p "Ingrese la primera fecha (Ej. 2020-01-01 20:20:20 puede ser sin hora): " fecha1
            	read -p "Ingrese la segunda fecha (Ej. 2020-01-01 20:20:20 puede ser sin hora): " fecha2
            	clear
            	journalctl --since "$fecha1" --until "$fecha2" | more
            	;;
        	2)
            	read -p "Ingrese un id de usuario: " id
            	journalctl _UID="$id" | more
            	;;
        	3)
            	journalctl -u httpd.service --since yesterday | more
            	;;
        	4)
            	faillog | more
            	;;
          5)
              sh logs_login.sh
	      ;;
        	0)
            	break
            	;;
        	*)
            	echo "Opción incorrecta"
            	show_status
            	;;
    	esac
	done
}

menuPuertos() {
	while true; do
    	clear
    	echo "=============================="
    	echo " Menú para gestionar puertos - SIGTO"
    	echo "=============================="
    	echo "1. Habilitar puerto"
    	echo "2. Cerrar puerto"
    	echo "3. Reiniciar servicio"
    	echo "0. Salir"
    	echo "=============================="
    	read -p "Ingrese una opción: " opP

    	case $opP in
        	1)
            	read -p "Ingrese el número de puerto: " puerto
            	read -p "Ingrese el tipo de protocolo (tcp/udp): " protocolo
            	sudo ufw allow $puerto/$protocolo
            	show_status
            	;;
        	2)
            	read -p "Ingrese el número de puerto: " puerto
            	read -p "Ingrese el tipo de protocolo (tcp/udp): " protocolo
            	sudo ufw deny $puerto/$protocolo
            	show_status
            	;;
        	3)
            	read -p "Ingrese el nombre del servicio a reiniciar: " service
            	sudo systemctl restart $service
            	show_status
            	;;
        	0)
            	break
            	;;
        	*)
            	echo "Opción incorrecta"
            	show_status
            	;;
    	esac
	done
}

main
