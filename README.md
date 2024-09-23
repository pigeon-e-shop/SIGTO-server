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
##### Instalar python
```
sudo apt install python3
```
#### Instalar ansible y configurar ansible

###### Actualizar la lista de paquetes
```
sudo apt update
```
###### Instalar ansible
```
sudo apt install ansible
```
###### Instalar git
```
sudo apt install git
```
###### Clonar el repositorio con los playbooks
```
git clone https://github.com/pigeon-e-shop/SIGTO-server.git
```
###### Ejecutar el playbook
```
ansible-playbook -i /home/pigeon/SIGTO-server/config/inventario.ini /home/pigeon/SIGTO-server/playbooks/setup.yml
```
##### Reiniciar
```
reboot
```
