# Práctica 1: Lógica computacional

## Prerrequisitos

1. **Instalación de Swipl**
	- Es necesario instalar Swipl en la máquina que sobre la que se quiera ejecutar el programa.
	- En el caso de OpenSuse es necesario introducir los siguientes comandos:

~~~~

zypper addrepo https://download.opensuse.org/repositories/devel:languages:prolog/openSUSE_Factory/devel:languages:prolog.repo
	zypper refresh
	zypper install swipl

~~~~

Una vez instalado el Swipl solo tenemos que entrar en la carpeta /practica1/ y ejecutar el comando swipl validador_mov.pl



## Guía rápida de uso
*Aquí introduciré los pasos  de manera sencilla para ejecutar el validador.*

## Elegir el problema a resolver
El problema que queremos resolver es estudiar el movimiento de dos fichas de ajedrez, a saber, el caballo y la torre. De esta manera, una vez coloquemos las piezas, introducimos el movimiento que queremos validar y teniendo en cuenta sus posibles movimientos y el resto de fichas en el tablero nos comprueba si el movimiento es legal.

## Describir las reglas del sistema en lenaguaje natural

1. **Tablero** 

	- El *tablero* consta de 64 casillas. Las casillas alternan blanco y negro de manera consecutiva.
	-El *tablero* para poder señalizar los movimientos consta de una numeración de filas (1 a 8) y de columnas (A a H). 
	- Al inicio, el jugador con piezas blancas empieza en el lado en el que su rey (blanco) se coloca en la casilla negra y el jugador con piezas negras en el lado con la casilla del rey blanca. La disposición es la siguiente: cada jugador ocupa las dos primeras filas (1,2 y 7,8), estando la primera reservada para todas las fichas que no sean peones (Torre, Caballo, Alfil, Rey/Reina) y la siguiente para los peones.   

2. **Torre**

	- La *torre* puede moverse sin límite de casillas de manera lateral y frontal. No pudiendo moverse en diagonal ni de manera análoga al caballo.
	- La *torre* puede moverse hacia delante o hacia atrás. Si en su desplazamiento se encontrara con una ficha propia no podrá saltarla y si fuera de	l contrario se la podría comer y ocupar entonces su posición.
	- **Mirar como poner el enlace en markdown para documentacion.**
3. **Caballo**
	
	- El *caballo* se mueve de la siguiente manera: se mueve desplazandose dos casillas en línea recta, esto es, hacia delante o hacia atrás y a continuación se desplaza una casilla lateralmente imitando la forma de una 'L'.
	- El *caballo* puede en su movimiento saltar por encima de piezas propias o ajenas, sin poder ocupar la misma posición que una pieza propia. Si la pieza que coincide en su trayectoria es ajena se la come y pasa a ocupar su lugar.  

4. **Turno**
	- Cada jugador durante su turno puede hacer un movimiento con la pieza que desee mientras no haya sido eliminada. Los turnos son alternos entre uno y otro empezando siempre el jugador con piezas blancas.


