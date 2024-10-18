#!/bin/bash

#Creación de grupos
sudo groupadd -f grupoprogramadores
sudo groupadd -f grupotester
sudo groupadd -f grupoanalistas
sudo groupadd -f grupodisenadores

#Creación de usuarios y asignación de grupos
sudo useradd -m -G grupoprogramadores programadores
sudo useradd -m -G grupotester tester
sudo useradd -m -G grupoanalistas analistas
sudo useradd -m -G grupodisenadores disenadores

#Cambiar permisos de dueños y grupos para el directorio ./Examenes-UTN/alumno_{1..3} y ./Examenes-UTN/profesores
sudo chown -R programadores:grupoprogramadores ./Examenes-UTN/alumno_1
sudo chmod -R 750 ./Examenes-UTN/alumno_1

sudo chown -R tester:grupotester ./Examenes-UTN/alumno_2
sudo chmod -R 760 ./Examenes-UTN/alumno_2

sudo chown -R analistas:grupoanalistas ./Examenes-UTN/alumno_3
sudo chmod -R 700 ./Examenes-UTN/alumno_3

sudo chown -R disenadores:grupodisenadores ./Examenes-UTN/profesores
sudo chmod -R 775 ./Examenes-UTN/profesores

#Creacion de archivo validar.txt en ./Examenes-UTN/alumno_{1..3} y ./Examenes-UTN/profesores
su -c "whoami > ./Examenes-UTN/alumno_1/validar.txt" programadores
su -c "whoami > ./Examenes-UTN/alumno_2/validar.txt" tester
su -c "whoami > ./Examenes-UTN/alumno_3/validar.txt" analistas
su -c "whoami > ./Examenes-UTN/profesores/validar.txt" disenadores
