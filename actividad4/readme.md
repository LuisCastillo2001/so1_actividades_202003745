## Código del bash
```
#!/bin/bash

while true; do
    echo "Hola Luis la fecha y hora actual es: $(date)"
    sleep 1
done
```

## Creacion del servicio
![image](https://github.com/user-attachments/assets/51ed05ea-7a31-49ca-abd9-e4617aa151d2)  
Damos los permisos y ejecutamos el comando touch para crear el archivo .service  

## Modificamos el servicio
Con el comando nano, procedemos ha abrir el archivo .service  
Y le agregamos lo siguiente:  
![image](https://github.com/user-attachments/assets/4f4359cf-06a0-4fd2-a832-140536b162d2)  
Una pequeña guía del significado de cada comando:  
### Description: 
Podemos introducir aquí el nombre y una descripción de lo que va a hacer nuestro daemon, en este caso podemos poner lo que nosotros queramos,     
es una descripción de cara al administrador de sistemas, para conocer qué hace el daemon sin necesidad de mirar más código.    
### After: 
Indicaremos si queremos que se cargue después de otros servicios o componentes del sistema.   
### User: 
el usuario del sistema operativo que ejecutará el daemon.
### ExecStart: 
Debemos indicar la ruta absoluta (no funcionan relativas) al script o binario que queremos ejecutar para arrancar el servicio en cuestión.

## Ejecutar el servicio  
Se ejecutan los siguientes 3 comandos para que el servicio sea activado:  
![image](https://github.com/user-attachments/assets/59c3e2b6-b8e8-4b16-81a9-5b3c6d19902d)  

Y para poder ver que el servicio se esta ejecutando correctamente, se ejecuta el comando:  
- sudo systemctl status saludo.service  
Y mostrará lo siguiente:  
![image](https://github.com/user-attachments/assets/ae28ed57-9129-40d3-b8ee-71784e6ddc97)   
Y para ver los logs del servicio se ejecuta el siguiente comando:  
- sudo journalctl -u saludo.service -f  
![image](https://github.com/user-attachments/assets/885abbf9-7020-4eca-8893-715097f22d4b)






