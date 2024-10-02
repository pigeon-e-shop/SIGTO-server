# SIGTO-server

## Manual de instalacion

### Pre-requisitos
Para poder utilizar este tutorial deberas tener:
+ Ubuntu Server 24.04 LTS
+ Conexion a internet

### Instalacion

##### Actualizar la lista de paquetes
```
sudo apt update
```
##### Instalar git
```
sudo apt install git
```
##### Clonar el repositorio SIGTO-server
```
git clone https://github.com/pigeon-e-shop/SIGTO-server.git
```
##### Ejecutar el .sh llamado install_docker.sh
```
sudo su
cd /home/pigeon/SIGTO-server/scripts && ./install_docker.sh
```
##### Clonar el respositorio principal
```
git clone https://github.com/pigeon-e-shop/SIGTO.git
```
##### Contruir el docker-compose.yml con docker-compose
```
cd /home/pigeon/SIGTO
sudo docker-compose up --build -d
```

