#!/bin/bash

# Variables de color ANSI
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color (Reset)

# Variables
NETWORK="192.168.1"  # Red local por defecto
TIMEOUT=5            # Tiempo de espera para escaneo

# Función para mostrar el encabezado
header() {
  clear
  echo "${CYAN}
   ██████╗  ██████╗ ███╗   ███╗ ██████╗ ██╗   ██╗
  ██╔═══██╗██╔═══██╗████╗ ████║██╔═══██╗██║   ██║
  ██║   ██║██║   ██║██╔████╔██║██║   ██║██║   ██║
  ██║   ██║██║   ██║██║╚██╔╝██║██║   ██║██║   ██║
  ╚██████╔╝╚██████╔╝██║ ╚═╝ ██║╚██████╔╝╚██████╔╝
   ╚═════╝  ╚═════╝ ╚═╝     ╚═╝ ╚═════╝  ╚═════╝
  ${NC}"
  echo "${YELLOW}
  ╦═╗╔═╗╔╦╗╦═╗╔═╗   ╔═╗╔╦╗╦ ╦╔═╗╔═╗
  ╠╦╝║ ║ ║ ╠╦╝║ ║   ║ ║ ║ ║ ║║  ║ ║
  ╩╚═╚═╝ ╩ ╩╚═╚═╝   ╚═╝ ╩ ╚═╝╚═╝╚═╝
  ${NC}"
  echo "${GREEN}
           _   _
          | | | |  Actech
          | |_| |
          Local Network Security Scanner
                 By Lux-RFM
  ${NC}"
  sleep 2 # Mostrar el encabezado por 2 segundos
}

# Función para escanear la red
scan_network() {
  echo "${CYAN}Escaneando la red ${NETWORK}.0/24...${NC}"
  for i in $(seq 1 254); do
    ping -c 1 -W ${TIMEOUT} ${NETWORK}.${i} > /dev/null 2>&1
    if [ $? -eq 0 ]; then
      echo "${GREEN}Dispositivo encontrado: ${NETWORK}.${i}${NC}"
      nmap -sn ${NETWORK}.${i} | grep "Nmap scan report"
    fi
  done
}

# Función para escanear puertos
scan_ports() {
  read -p "Introduce la dirección IP a escanear: " IP
  echo "${CYAN}Escaneando puertos comunes en ${IP}...${NC}"
  nmap -F ${IP}
}

# Función para verificar vulnerabilidades básicas (ejemplo)
check_vulnerabilities() {
  read -p "Introduce la dirección IP a verificar: " IP
  echo "${CYAN}Verificando vulnerabilidades básicas en ${IP}...${NC}"

  # Verificar si SSH está corriendo en el puerto por defecto (22)
  echo "${CYAN}Verificando si SSH está activo...${NC}"
  nmap -p 22 ${IP} | grep "ssh" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "${RED}¡Advertencia! SSH está activo en el puerto por defecto (22).${NC}"
    echo "${RED}Esto podría ser un riesgo de seguridad. Considera cambiar el puerto.${NC}"
    echo "${YELLOW}Recomendación: Cambia el puerto SSH a uno no estándar (mayor a 1024) y utiliza autenticación basada en claves en lugar de contraseñas.${NC}"
  else
    echo "${GREEN}SSH no está activo en el puerto por defecto (22).${NC}"
  fi

  # Verificar si Telnet está activo (puerto 23)
  echo "${CYAN}Verificando si Telnet está activo...${NC}"
  nmap -p 23 ${IP} | grep "telnet" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "${RED}¡Advertencia! Telnet está activo en el puerto 23.${NC}"
    echo "${RED}Telnet transmite las contraseñas en texto plano y es muy inseguro.${NC}"
    echo "${YELLOW}Recomendación: Desactiva Telnet y utiliza SSH en su lugar.${NC}"
  else
    echo "${GREEN}Telnet no está activo en el puerto 23.${NC}"
  fi

  echo "${CYAN}Pruebas básicas completadas.${NC}"
}

# Función para procesar los comandos introducidos por el usuario
process_command() {
  read -p "Actech-Terminal> " command
  case $command in
    scan-network) scan_network ;;
    scan-ports) scan_ports ;;
    check-vulns) check_vulnerabilities ;;
    ping) read -p "Introduce la dirección IP: " IP; ping -c 3 $IP ;;
    traceroute) read -p "Introduce la dirección IP o dominio: " TARGET; traceroute $TARGET ;;
    whois) read -p "Introduce la dirección IP o dominio: " TARGET; whois $TARGET ;;
    help)
      echo "${CYAN}Comandos disponibles:${NC}"
      printf "%-15s %s\n" "scan-network" "Escanea la red local"
      printf "%-15s %s\n" "scan-ports" "Escanea los puertos de un dispositivo"
      printf "%-15s %s\n" "check-vulns" "Verifica vulnerabilidades básicas"
      printf "%-15s %s\n" "ping" "Verifica la conectividad"
      printf "%-15s %s\n" "traceroute" "Traza la ruta a un dispositivo"
      printf "%-15s %s\n" "whois" "Obtiene información de dominio/IP"
      printf "%-15s %s\n" "help" "Muestra esta ayuda"
      printf "%-15s %s\n" "exit" "Sale de la terminal"
      ;;
    exit) exit 0 ;;
    *) echo "${RED}Comando inválido. Inténtalo de nuevo. Escribe 'help' para ver los comandos disponibles.${NC}" ;;
  esac
}

# Llamar a la función header para mostrar el encabezado al inicio
header

# Ejecución del bucle principal
while true; do
  process_command
done

