#!/bin/bash

show_successful_logins() {
	echo "Mostrando intentos de login exitosos:"
	last
}

show_failed_logins() {
	echo "Mostrando intentos de login fallidos:"
	lastb
}

show_journal_logins() {
	echo "Mostrando registros de login desde el journal del sistema:"
	sudo journalctl _COMM=sshd | grep -E "Failed|Accepted"
}

show_help() {
	echo "Uso: $0 [opción]"
	echo "Opciones disponibles:"
	echo "  1) Mostrar intentos de login exitosos"
	echo "  2) Mostrar intentos de login fallidos"
	echo "  3) Mostrar logs de login desde el journal del sistema"
	echo "  4) Mostrar esta ayuda"
	echo "  0) Salir"
}

main_menu() {
	while true; do
    	echo ""
    	echo "----- MENÚ PRINCIPAL -----"
    	echo "1) Mostrar intentos de login exitosos"
    	echo "2) Mostrar intentos de login fallidos"
    	echo "3) Mostrar logs de login desde el journal del sistema"
    	echo "4) Mostrar ayuda"
    	echo "0) Salir"
    	echo "--------------------------"
    	read -p "Seleccione una opción: " option

    	case $option in
        	1) show_successful_logins ;;
        	2) show_failed_logins ;;
        	3) show_journal_logins ;;
        	4) show_help ;;
        	0) echo "Saliendo..."; exit 0 ;;
        	*) echo "Opción inválida, por favor intente de nuevo." ;;
    	esac
	done
}

main_menu
