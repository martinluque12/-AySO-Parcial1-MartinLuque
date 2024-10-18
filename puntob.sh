#!/bin/bash

#Resultado de ejecutar lsblk antes de particionar el disco.
#NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
#loop0    7:0    0 63.9M  1 loop /snap/core20/2318
#loop1    7:1    0   87M  1 loop /snap/lxd/29351
#loop2    7:2    0 38.8M  1 loop /snap/snapd/21759
#sda      8:0    0   40G  0 disk
#└─sda1   8:1    0   40G  0 part /
#sdb      8:16   0   10M  0 disk
#sdc      8:32   0   10G  0 disk
#sdd      8:48   0    2G  0 disk

#Partición del disco en 3 particiones primarias y una extendida.
(echo n; echo p; echo 1; echo; echo +2.5G;
 echo n; echo p; echo 2; echo; echo +2.5G;
 echo n; echo p; echo 3; echo; echo +2.5G;
 echo n; echo e; echo 4; echo; echo;
 #echo n; echo; echo 5; echo;              #Partición lógica
 echo w) | sudo fdisk /dev/sdc

#Formateo de las particiones con ext3
sudo mkfs.ext3 /dev/sdc1
sudo mkfs.ext3 /dev/sdc2
sudo mkfs.ext3 /dev/sdc3
#sudo mkfs.ext3 /dev/sdc5                  #Formateo de la partición lógica

#Creación de los directorios de montaje
sudo mkdir -p /mnt/part1
sudo mkdir -p /mnt/part2
sudo mkdir -p /mnt/part3
#sudo mkdir -p /mnt/part4                  #Directorio para montaje de partición lógica

#Montaje de las particiones
sudo mount /dev/sdc1 /mnt/part1
sudo mount /dev/sdc2 /mnt/part2
sudo mount /dev/sdc3 /mnt/part3
#sudo mount /dev/sdc5 /mnt/part4           #Montaje de la partición lógica

#Resultado de ejecutar lsblk después de particionar el disco
#NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
#loop0    7:0    0 63.9M  1 loop /snap/core20/2318
#loop1    7:1    0   87M  1 loop /snap/lxd/29351
#loop2    7:2    0 38.8M  1 loop /snap/snapd/21759
#sda      8:0    0   40G  0 disk
#└─sda1   8:1    0   40G  0 part /
#sdb      8:16   0   10M  0 disk
#sdc      8:32   0   10G  0 disk
#├─sdc1   8:33   0  2.5G  0 part /mnt/part1
#├─sdc2   8:34   0  2.5G  0 part /mnt/part2
#├─sdc3   8:35   0  2.5G  0 part /mnt/part3
#└─sdc4   8:36   0    1K  0 part
#sdd      8:48   0    2G  0 disk
