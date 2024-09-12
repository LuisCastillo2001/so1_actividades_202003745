<h1>Tipos de kernel y sus diferencias</h1>  
El kernel es el núcleo del sistema operativo, encargado de gestionar los recursos del sistema y permitir la comunicación entre el software y el hardware.  
Actúa como un puente entre las aplicaciones y los componentes físicos de la computadora, manejando tareas  como la ejecución de programas, el acceso a archivos y   
la conexión con dispositivos.    
<h3>Kernel Monolítico:</h3>    
Los kernels monolíticos son el tipo de kernel más simple y común. Incluyen la funcionalidad central del sistema operativo y   
admiten todos los dispositivos conectados a él. En este tipo de kernel, los servicios de usuario y del kernel se implementan en el mismo espacio de memoria.   
Debido a esto, el tamaño del kernel aumenta, lo que a su vez incrementa el tamaño del sistema operativo.
<h3>MicroKernel</h3>
Los microkernels son un desarrollo más reciente y, por lo tanto, no son tan comunes como los kernels monolíticos. 
Incluyen solo los servicios esenciales y los dispositivos necesarios para que el sistema funcione, lo que da como resultado un kernel más pequeño, más rápido y 
que utiliza menos memoria. En este tipo de kernel, los servicios de usuario y del kernel se implementan en dos espacios diferentes: Espacio de Usuario y Espacio de 
Kernel. Esto reduce el tamaño del kernel y, en consecuencia, disminuye el tamaño del sistema operativo.
<h3>Kernel Híbrido</h3>
Los kernels híbridos combinan características de los kernels monolíticos y microkernels. Incluyen más servicios que los microkernels, pero menos que los 
kernels monolíticos. Esto les permite ofrecer algunos de los beneficios de ambos tipos de kernels. Obtienen la velocidad de los kernels monolíticos y la modularidad de
los microkernels.  
<h3>NanoKernel</h3>
Los nanokernels son el tipo de kernel más pequeño, con solo unos pocos miles de líneas de código. Esto significa que el código que se 
ejecuta en el modo privilegiado del hardware es mínimo. Se utilizan principalmente en sistemas embebidos o dispositivos con recursos limitados.
<h3>ExoKernel</h3>
Este tipo de kernel tiene una protección y gestión de recursos separada. Es adecuado para la personalización específica de aplicaciones. 
Los exokernels están diseñados para su uso en dispositivos móviles. Son una variación de los microkernels
que incluyen características adicionales específicamente para dispositivos móviles, como la gestión de energía y el soporte para múltiples procesadores.

<h1>Kernel vs Usermode</h1>
<h3>User mode</h3>
Siempre que se ejecuta una aplicación, esta se ejecuta en el modo usuario. Por ejemplo, si se esta utilizando MS Word o viendo un 
video con el VLC Player, todas estas aplicaciones de software se ejecutan en el modo usuario. Al abrir el programa en modo usuario, no se permite acceder
directamente a la RAM y al hardware. Para acceder al hardware y a la RAM en modo usuario, 
envía una solicitud al núcleo del sistema. Por esta razón, el modo usuario también se conoce como modo esclavo o modo restringido.
<h3>Kernel Mode </h3>
El kernel es el programa central en el que se basan todos los demás componentes del sistema operativo. 
Se utiliza para acceder a los componentes de hardware, programar qué procesos deben ejecutarse en un sistema informático y cuándo, y también gestiona la 
interacción entre el software de aplicaciones y el hardware. Por lo tanto, es el programa con mayor privilegio; a diferencia de otros programas, 
puede interactuar directamente con el hardware. Cuando los programas que se ejecutan en modo usuario necesitan acceso al hardware, como una cámara web, 
primero deben pasar por el kernel mediante una llamada al sistema (syscall). 
Para llevar a cabo estas solicitudes, la CPU cambia de modo usuario a modo kernel durante la ejecución.<br></br>
  
<table>
        <thead>
            <tr>
                <th>Criterio</th>
                <th>Modo Kernel</th>
                <th>Modo Usuario</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Acceso a Recursos</td>
                <td>Acceso directo a la RAM y hardware.</td>
                <td>No hay acceso directo a la RAM y hardware. Se requiere una llamada al sistema para acceder a estos recursos.</td>
            </tr>
            <tr>
                <td>Modos</td>
                <td>También conocido como modo maestro, privilegiado o de sistema.</td>
                <td>También conocido como modo no privilegiado, esclavo o restringido.</td>
            </tr>
            <tr>
                <td>Nivel de Privilegios</td>
                <td>Mayor privilegio para acceder a los recursos del sistema, como RAM y hardware.</td>
                <td>Menor privilegio para acceder a los recursos del sistema comparado con el modo kernel.</td>
            </tr>
            <tr>
                <td>Espacio de Direcciones Virtuales</td>
                <td>Todos los procesos y solicitudes comparten el mismo espacio de direcciones virtuales.</td>
                <td>Todos los procesos y solicitudes tienen un espacio de direcciones virtuales separado.</td>
            </tr>
            <tr>
                <td>Restricciones</td>
                <td>Sin restricciones; se puede acceder tanto a programas de usuario como a programas del kernel.</td>
                <td>Restricciones; no se puede acceder directamente a los programas de usuario y del kernel. Se necesita una llamada al sistema para este acceso.</td>
            </tr>
            <tr>
                <td>Valor del Bit de Modo</td>
                <td>El bit de modo está establecido en 0.</td>
                <td>El bit de modo está establecido en 1.</td>
            </tr>
            <tr>
                <td>Interrupciones</td>
                <td>Probabilidad de que una interrupción pueda causar el apagado completo del sistema.</td>
                <td>El fallo de un solo proceso no causa el apagado completo del sistema; solo falla el proceso específico.</td>
            </tr>
            <tr>
                <td>Cierre del Sistema</td>
                <td>Un solo fallo del sistema puede llevar a problemas complicados.</td>
                <td>Un solo fallo del sistema no afecta a todo el proceso; se puede recuperar reanudando la sesión.</td>
            </tr>
            <tr>
                <td>Funcionalidad</td>
                <td>El modo kernel puede referirse a cualquier bloque de memoria en el sistema y acceder directamente a los recursos, siendo crucial para la ejecución de procesos.</td>
                <td>El modo usuario es más básico y estándar, sin acceso directo a hardware o RAM; utiliza una API para este propósito.</td>
            </tr>
        </tbody>
    </table>

<br></br>


<h1>Interruptions vs traps</h1>
    <table>
        <thead>
            <tr>
                <th>Criterio</th>
                <th>Trampa (Trap)</th>
                <th>Interrupción (Interrupt)</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Definición</td>
                <td>Una excepción en un proceso de usuario, causada por errores como división por cero o acceso a memoria inválida. También se utiliza para invocar rutinas del kernel (llamadas al sistema).</td>
                <td>Generado por hardware (dispositivos como disco duro, tarjeta gráfica, puertos I/O, etc.). Es una señal de hardware que requiere atención del sistema.</td>
            </tr>
            <tr>
                <td>Sincronía</td>
                <td>Sincrónico: el código de usuario se suspende hasta que la trampa se maneje y luego se reanuda.</td>
                <td>Asincrónico: no ocurre en lugares predecibles del código de usuario, el controlador de interrupciones espera a que ocurra.</td>
            </tr>
            <tr>
                <td>Generación</td>
                <td>Generado por errores en el código del usuario o por llamadas al sistema.</td>
                <td>Generado por eventos de hardware o señales externas al CPU.</td>
            </tr>
            <tr>
                <td>Contexto</td>
                <td>El manejador de trampas funciona de manera similar a un manejador de interrupciones: guarda registros y punteros de pila, realiza un cambio de contexto, y en algunos casos puede reanudar la ejecución donde se quedó.</td>
                <td>El manejador de interrupciones también guarda el estado del CPU y realiza un cambio de contexto, pero se desencadena de forma independiente al flujo del programa de usuario.</td>
            </tr>
            <tr>
                <td>Prioridad</td>
                <td>Las trampas tienen una prioridad alta porque suelen involucrar errores críticos o llamadas al sistema.</td>
                <td>Las interrupciones tienen alta prioridad para garantizar que el hardware pueda ser atendido oportunamente.</td>
            </tr>
            <tr>
                <td>Dependencia del Usuario</td>
                <td>Las trampas suelen ser esperadas y manejadas por el código de usuario, por lo que el sistema espera que ocurran y tiene mecanismos para manejarlas.</td>
                <td>Las interrupciones son generalmente inesperadas y el sistema debe estar preparado para manejarlas de manera eficiente cuando ocurren.</td>
            </tr>
        </tbody>
    </table>
