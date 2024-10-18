#!/bin/bash

#Obtener información de la cantidad de memoria RAM de la PC
total_ram=$(grep MemTotal /proc/meminfo)

#Obtener información del fabricante del chassis de la PC
chassis_info=$(sudo dmidecode -t chassis | grep "Manufacturer")

#Crear archivo Filtro_Basico y escribir la información solicitada
{
    echo "Cantidad de memoria RAM de la PC:"
    echo "$total_ram"
    echo "Fabricante del chassis de la PC:"
    echo "$chassis_info"
} > Filtro_Basico.txt
