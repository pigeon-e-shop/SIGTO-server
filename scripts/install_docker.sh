#!/bin/bash

# Salir si hay algún error
set -e

# Actualizar el sistema
echo "Actualizando el sistema..."
sudo apt update && sudo apt upgrade -y

# Instalar paquetes necesarios
echo "Instalando paquetes necesarios..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Agregar la clave GPG oficial de Docker
echo "Agregando la clave GPG de Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Agregar el repositorio de Docker
echo "Agregando el repositorio de Docker..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Actualizar el índice de paquetes
echo "Actualizando el índice de paquetes nuevamente..."
sudo apt update

# Instalar Docker
echo "Instalando Docker..."
sudo apt install -y docker-ce

# Verificar que Docker esté instalado correctamente
echo "Verificando la instalación de Docker..."
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

# Agregar el usuario actual al grupo Docker
echo "Agregando el usuario al grupo Docker..."
sudo usermod -aG docker $USER

# Instalar Docker Compose
echo "Instalando Docker Compose..."
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verificar la instalación de Docker Compose
echo "Verificando la instalación de Docker Compose..."
docker-compose --version

echo "Instalación completada. Por favor, cierre la sesión y vuelva a iniciar sesión para aplicar los cambios en el grupo Docker."
