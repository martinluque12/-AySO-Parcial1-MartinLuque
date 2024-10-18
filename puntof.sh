#!/bin/bash

#Obtener la IP publica
ip_publica=$(curl -s ifconfig.me)

#Obtener el nombre de usuario actual
usuario=$(grep ":$(id -u):" /etc/passwd | cut -d ":" -f1)

#Obtener el Hash del usuario
hash_usuario=$(sudo grep "^$usuario" /etc/shadow | cut -d ":" -f2)

#Crear el archivo Filtro_Avanzado y escribir la información solicitada
{
    echo "Mi IP publica es: $ip_publica"
    echo "Mi usuario es: $usuario"
    echo "El Hash de mi usuario es: $hash_usuario"
} > Filtro_Avanzado.txt
