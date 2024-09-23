# SIGTO-server

## Manual de instalacion

### Pre-requisitos 📋
Para poder utilizar este tutorial deberas tener:
+ Ubuntu Server 24.04 LTS
+ Conexion a internet

### Instalacion

#### Actualizar la lista de paquetes
```
sudo apt update
```
#### Instalar python
```
sudo apt install python3
```
#### Instalar ansible y configurar ansible

##### Agregar el respositorio de ansible
```
sudo apt-add-repository ppa:ansible/ansible
```
##### Actualizar la lista de paquetes
```
sudo apt update
```
##### Instalar ansible
```
sudo apt install ansible
```
##### Configurar como interprete de python el instalado anteriormente
```
echo "
[all:vars]
ansible_python_interpreter=/usr/bin/python3
" > /etc/ansible/hosts
```
##### Instalar git
```
sudo apt install git
```
##### Clonar el repositorio con los playbooks
```
git clone https://github.com/pigeon-e-shop/SIGTO-server.git
```
##### Ejecutar el playbook
```
ansible /home/pigeon/SIGTO-server/setup.yml
```
##### Reiniciar
```
reboot
```

### 
