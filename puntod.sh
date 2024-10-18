#!/bin/bash

#Creación del directorio Estructura_Asimetrica y subdirectorios correo y clientes
sudo mkdir -p Estructura_Asimetrica/correo Estructura_Asimetrica/clientes

#Creación de cartas de 1 a 50 en los directorios correo y clientes
for i in {1..50}; do
    sudo touch Estructura_Asimetrica/correo/cartas_$i
    sudo touch Estructura_Asimetrica/clientes/cartas_$i
done

#Creación de carteros de 1 a 10 en el directorio correo
for j in {1..10}; do
    sudo touch Estructura_Asimetrica/correo/cartero_$j
done
