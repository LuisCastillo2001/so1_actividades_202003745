##Para el funcionamiento del crontab y prueba de que funciono,
se adjuntan las capturas que se ejecutará cada 5 minutos
![image](https://github.com/user-attachments/assets/ee3eecd7-b1a6-4101-be91-6f2e17c3e384)

Archivo crontab:
![image](https://github.com/user-attachments/assets/4ef10240-d690-4eb6-b53a-cda7a17cd5db)

##Explicacion de los comandos y variables usadas

- Asigna el primer argumento de línea de comandos al parámetro GITHUB_USER.
api="https://api.github.com/users/$GITHUB_USER"

- Crea el directorio especificado y todos los directorios padres necesarios.
mkdir -p "$dir"

- Obtiene el ID de usuario de la respuesta de la API utilizando curl y jq.
ID_USER=$(curl -s $api | jq '.id')

- Añade una línea de texto al archivo de salida con el saludo, ID de usuario y fecha de creación.
echo "Hola $GITHUB_USER , USER_ID: $ID_USER , CUENTA FUE CREADA EL: $CREATED_AT " >> "$dir/$archivo_salida"

##Comandos comentados

#id_user=$(curl -s $api | grep '"id"' | sed -n '1p' | cut -d':' -f 2 | tr -d ', ')

- curl -s $api descarga el contenido de la API de GitHub de forma silenciosa(Nota: Suprimira el mensaje de error y de progreso que la api obtenga con -s).
- grep '"id"' filtra las líneas que contienen "id".
- sed -n '1p' imprime solo la primera coincidencia.
- cut -d':' -f 2 divide la línea por el carácter : y toma el segundo campo.
- tr -d ', ' elimina las comas y espacios.


