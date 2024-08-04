
# Parte 1 Gestión de usuarios
#Para acceder como usuario root
- su - 
## Creación de usuarios usando adduser
- adduser usuario1
- adduser usuario2
- adduser usuario3
## Actualización de contraseñas usando passwd
- passwd usuario1
- passwd usuario2
- passwd usuario3

<img src="https://github.com/user-attachments/assets/7c024e32-68c4-49d9-ba8c-bd27b454983a" alt="image" width="300" style="float:left; margin-right:10px;">


## Información del usuario 1
- id usuario1

![image](https://github.com/user-attachments/assets/452eaf1a-f128-4960-94fe-6b3c3dd2c578)

## Eliminación del usuario 3
- deluser usuario3
### Comprobando que su directorio principal aún existe

![image](https://github.com/user-attachments/assets/f3a82e50-4c34-4da5-b73d-00ec0ea4c4e4)

# Parte 2 Gestion de grupos
## Creación de grupos
groupadd grupo1__
groupadd grupo2__

## Agregar usuarios a grupos
- usermod -a -G grupo1 usuario1
- usermod -a -G grupo2 usuario2

## Verificar la membresía
- groups usuario1
- groups usuario2

![image](https://github.com/user-attachments/assets/a816288f-32a1-4da2-bad9-369f99f45f68)

## Eliminación de grupo 2
- groupsdel grupo2

# Parte 3 gestión de permisos
Para acceder como usuario 1:
- su - usuario1

## Creación de archivos y directorios
- touch archivo1.txt
- ls
- echo "Hola mi nombre es luis" > archivo1.txt
- cat archivo1.txt

![image](https://github.com/user-attachments/assets/b5192db4-4a50-4c66-bd0a-f7cfd8654903)

- mkdir directorio1
- cd directorio1/
- touch archivo1.txt

## Verificación de permisos

![image](https://github.com/user-attachments/assets/023df9ea-1b1d-4b05-b177-99877f81a700)

## Modificar permisos usando chmod númerico
- chmod 640 archivo1.txt

![image](https://github.com/user-attachments/assets/8f4d9f26-c2f6-48ea-8568-c3386a159d33)

## Modificar permisos usando chmod simbólico
- chmod u+x archivo2.txt

![image](https://github.com/user-attachments/assets/dd26d475-c82d-4461-8ea3-cbc805e0c2b4)

## Cambiar el grupo a propietario
- chgrp grupo1 archivo2.txt 

![image](https://github.com/user-attachments/assets/bbc1eebf-d732-41b0-afc9-4a38724a6c65)

## Permisos de directorio
- chmod 740 directorio1

![image](https://github.com/user-attachments/assets/073637c6-ee6e-4ccb-813e-6c1551e1022a)

## Verificacion de permisos

![image](https://github.com/user-attachments/assets/dbed6a0f-b51d-4dec-a95b-32397c4b056d)

