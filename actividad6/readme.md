## Pregunta 1
Cada vez que se llama a fork, se crean dos procesos el proceso padre (el que hizo la llamada fork()) y un nuevo proceso hijo. Esto quiere decir que se van 
multilplicando.   
Entonces el calculo sería 2 elevado a la 3.  Lo cual nos da un resultado de 8 procesos.

## Pregunta 2
``` c 
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    pid_t pid = fork();

    if (pid < 0) {
        
        perror("fork");
        exit(1);
    } else if (pid == 0) {
        
        printf("Proceso hijo (PID: %d) creado para volverse un proceso zombie\n", getpid());
        _exit(0); 
    } else {
       
        printf("Proceso padre (PID: %d) durmiendo por 60 segundos.\n", getpid());
        sleep(60);as a zombie
        printf("Proceso padre levantandose.\n");
        waitpid(pid, NULL, 0); process
    }

    return 0;
}
```
Con el comando ps -l se muestra lo siguiente 
``` 
F   UID     PID    PPID PRI  NI    VSZ   RSS WCHAN  STAT TTY        TIME COMMAND
0  1000    2938    1540  20   0   2776   988 hrtime S+   pts/4      0:00 ./zombie_process
1  1000    2939    2938  20   0      0     0 -      Z+   pts/4      0:00 [zombie_process] <defunct>

```


## Pregunta 3

``` C
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>


void *thread_function(void *arg) {
    printf("Hilo creado con TID: %ld\n", pthread_self());
    return NULL;
}

int main() {
    pid_t pid;
    pthread_t thread;

    
    pid = fork(); 
    if (pid < 0) {
        perror("Error en fork");
        exit(1);
    } else if (pid == 0) { /* Proceso hijo */
       hijo
        fork(); 

        
        pthread_create(&thread, NULL, thread_function, NULL);
        pthread_join(thread, NULL);  
    }

   
    fork(); 

    sleep(1);  //
    return 0;
}
```

¿Cuántos procesos únicos son creados?



- Primera llamada a fork():

Crea 1 proceso hijo.
Total de procesos hasta ahora: 2 (proceso original + 1 hijo).
- Segunda llamada a fork() (dentro del primer proceso hijo):

Crea otro proceso hijo.
Ahora hay 3 procesos: el proceso original, el primer proceso hijo y un segundo proceso hijo creado a partir del primero.
- Tercera llamada a fork():

Esta llamada es ejecutada por todos los procesos existentes (el proceso original y los dos procesos hijos).
Cada uno de los 3 procesos crea 1 proceso hijo adicional, sumando 3 nuevos procesos.
  
  Total de procesos: 6.


¿Cuántos hilos únicos son creados?

Solo hay una llamada, no obstante un proceso lleva un hilo implicitamente para su ejecución, esto quiere decir que hay 2 hilos creados.
