# Local Network Security Scanner (LNSS)

## Descripción

Local Network Security Scanner (LNSS) es una herramienta de línea de comandos para la auditoría y administración básica de redes locales. Permite escanear la red, identificar dispositivos, evaluar vulnerabilidades y realizar acciones correctivas elementales.

## Características

*   Escaneo de la red local.
*   Identificación de dispositivos conectados.
*   Evaluación de vulnerabilidades básicas (ejemplo: SSH en el puerto por defecto).
*   Comandos para solucionar problemas de red (ping, traceroute, whois).
*   Bloqueo de usuarios no deseados (requiere iptables).

## Requisitos

*   Termux (o un entorno Linux similar)
*   `nmap`
*   `ping`
*   `traceroute`
*   `whois`
*   `iptables` (para bloquear usuarios)

## Instalación

1.  Clona este repositorio: `git clone [URL del repositorio]`
2.  Navega al directorio del proyecto: `cd LocalNetSecScan`
3.  Dale permisos de ejecución al script: `chmod +x LocalNetSecScan.sh`

## Uso

Ejecuta el script: `./LocalNetSecScan.sh`

Aparecerá una terminal interactiva. Escribe `help` para ver los comandos disponibles.

## Comandos

*   `scan-network`: Escanea la red local.
*   `scan-ports`: Escanea los puertos de un dispositivo.
*   `check-vulns`: Verifica vulnerabilidades básicas.
*   `fix-ssh`: Corrige la vulnerabilidad SSH (ejemplo).
*   `block-user`: Bloquea el acceso de un usuario.
*   `ping`: Verifica la conectividad.
*   `traceroute`: Traza la ruta a un dispositivo.
*   `whois`: Obtiene información de dominio/IP.
*   `help`: Muestra esta ayuda.
*   `exit`: Sale de la terminal.

## Advertencia

Esta herramienta es para fines educativos y de auditoría. Utilízala bajo tu propia responsabilidad. Algunas funciones requieren permisos de root y pueden causar daños si se utilizan incorrectamente.

## Licencia

Este proyecto está licenciado bajo la MIT License - ver el archivo (LICENSE) para más detalles.

## Autor

[X_X | FenrirXlll] - [ ... ]

## Créditos

*   Inspirado por Lux-RFM y Actech.

