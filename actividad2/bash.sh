GITHUB_USER="$1"
api="https://api.github.com/users/$GITHUB_USER"

#Los archivos
archivo_salida="saludos.log"
fecha=$(date --iso-8601)        # Imprime la fecha en formato YYYY-MM-DD
dir="/tmp/$fecha"


#Crear de forma recursiva los directorios
mkdir -p "$dir"                  # Usa -p para crear todos los directorios necesarios

#Otra forma menos eficiente
#sed, en este caso imprime la primera coincidencia
#head toma solo la primera linea

#id_user=$(curl -s $api | grep '"id"' |  sed -n '1p' | cut -d':' -f 2 | tr -d ', ')
#id_user=$(curl -s $api | grep '"id"' |  head -n 1 | cut -d':' -f 2 | tr -d ', ')

# Forma más eficiente
ID_USER=$(curl -s $api | jq '.id')
CREATED_AT=$(curl -s $api | jq '.created_at')

echo "Hola $GITHUB_USER , USER_ID: $ID_USER , CUENTA FUE CREADA EL: $CREATED_AT " >> "$dir/$archivo_salida"

#Para crear un cronjob
#crontab -e
#Agregar al archivo lo siguiente y presionar ctrl + O
#*/min hor day month * /home/luis/Documentos/magistral/tareas/tarea2/actividad2.sh luis2001xd