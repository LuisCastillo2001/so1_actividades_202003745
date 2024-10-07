

El Completely Fair Scheduler (CFS) es el planificador de procesos predeterminado en el kernel de Linux desde la versión 2.6.23 (2007). Fue diseñado para mejorar la eficiencia y equidad en la asignación de tiempo de CPU entre procesos, reemplazando al antiguo planificador basado en prioridades O(1). Las principales características y el funcionamiento del CFS son los siguientes:

### Equidad en la asignación de CPU
El objetivo principal del CFS es ser lo más "justo" posible en la asignación del tiempo de CPU entre todos los procesos, buscando que todos los procesos obtengan la misma cantidad de tiempo de procesamiento en función de su prioridad y naturaleza.
En lugar de priorizar procesos estrictamente por una política de prioridades fijas, CFS trata de asegurarse de que los procesos ejecutados durante mucho tiempo reciban menos CPU en el futuro, mientras que aquellos que han recibido menos CPU obtengan más oportunidades para ejecutarse.
###  Árbol rojo###negro para seguimiento de procesos
CFS utiliza una estructura de datos árbol rojo###negro (red###black tree), que es un tipo de árbol binario balanceado, para gestionar los procesos en cola de espera.
En este árbol, los procesos se organizan por el tiempo de ejecución que han recibido. Esto permite que la inserción, eliminación y búsqueda de procesos en la cola de ejecución tengan una complejidad de tiempo de O(log n), lo que es más eficiente que el enfoque O(1) del planificador anterior para sistemas con muchos procesos.
###  Tiempo virtual (vruntime)
CFS introduce el concepto de tiempo de ejecución virtual (virtual runtime o vruntime). Este tiempo virtual es una métrica que CFS utiliza para determinar cuánta CPU ha consumido un proceso.
El vruntime se incrementa más rápidamente para procesos que tienen una menor prioridad y más lentamente para aquellos con una mayor prioridad (basados en "niceness"). Esto significa que los procesos con menor prioridad consumen su "cuota" de CPU más rápidamente, dándoles menos tiempo de ejecución real.
Los procesos que tienen menor vruntime son los que se seleccionan para ejecutar primero, asegurando que los procesos que menos tiempo han ejecutado recientemente tengan preferencia.
###  Preemisión basada en el tiempo virtual
CFS es un planificador preemptivo, lo que significa que puede interrumpir a un proceso en ejecución si otro proceso tiene un vruntime menor (es decir, ha consumido menos CPU).
Cuando se selecciona el siguiente proceso a ejecutar, el proceso con el menor valor de vruntime es el elegido.
### Interactividad y nice values
Los valores de "niceness" (nice values) permiten a los usuarios y administradores ajustar la prioridad de los procesos de manera relativa, afectando la forma en que se calcula el tiempo virtual. Un proceso con un valor de niceness bajo (alta prioridad) avanzará más lentamente en su tiempo virtual, permitiéndole más tiempo de CPU. Los valores van de ###20 (máxima prioridad) a +19 (mínima prioridad).
El CFS también considera la interactividad de los procesos, dando preferencia a aquellos que son más interactivos (como aplicaciones que esperan mucho por eventos externos), asegurando que la experiencia del usuario con las aplicaciones interactivas sea fluida.
### No usa ticks fijos
A diferencia de los planificadores anteriores que utilizaban un sistema de "ticks" fijos para repartir el tiempo de CPU, el CFS utiliza un modelo sin ticks (tickless). Esto significa que el CFS no depende de interrupciones periódicas del reloj, sino que determina la duración de la ejecución de un proceso dinámicamente en función de sus necesidades y del vruntime.
### Procesos en segundo plano
CFS maneja los procesos de segundo plano (procesos batch) de manera eficiente al darles una prioridad más baja, asegurando que no interfieran con procesos interactivos o de alta prioridad, pero todavía obteniendo una cantidad justa de tiempo de CPU.
### Latencia y tiemposlice
El CFS tiene una métrica llamada "targeted latency" (latencia objetivo) que controla la duración total que debería pasar entre que un proceso comienza y vuelve a ser programado. Esto asegura que los procesos tengan una latencia de respuesta baja, especialmente en sistemas con menos carga.
Tiemposlice es el tiempo asignado a cada proceso dentro de un intervalo de planificación. En CFS, el tamaño del tiempo que cada proceso recibe no es un valor fijo, sino que varía dinámicamente en función de la cantidad de procesos activos y el valor de niceness.
### Escalabilidad
CFS está diseñado para ser altamente escalable, lo que significa que puede manejar eficientemente tanto sistemas con pocos procesos como sistemas con una gran cantidad de procesos. Gracias a su estructura basada en el árbol rojo###negro, mantiene un rendimiento eficiente a medida que aumenta el número de procesos.