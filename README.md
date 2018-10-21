Liga de Leyendas
----------------

Se nos pide modelar un pequeño sistema de batallas basado en el popular video juego League of Legends a.k.a Lol.
El sistema se basara en batallas de campeones contra oleadas de Minions, no habrá al menos de momento batallas entre campeones (conocidas popularmente como batallas en equipo).

Las batallas están basadas en un sistema simple de ataque y defensa. Cuando un campeón ataca, este le produce una daño a la oleada de Minions igual a los puntos de ataque que posee el campeón. Sin embargo, este recibe daño producido por los Minions que se defienden. Este es igual a la cantidad de Minions que conforman la oleada mas un plus que es definido en cada oleada.

Parte 1: 
--------

Como se explico antes, los campeones poseen puntos de ataque y puntos de vida, estos varían de campeón en campeón. Cuando un campeón batalla, este acumula puntos de daño. Los puntos de vida representan la cantidad de daño que puede resistir el campeón antes de morir. De esta forma, cuando los puntos de daño son iguales a los puntos de vida, el campeón se lo considera muerto. 
Para ayudar a la supervivencia del campeón, existen los bloqueos. Un Bloqueo, es la capacidad de resistir todo el daño que el campeón recibe en una batalla contra una oleada de Minions. Esto quiere decir que si poseo 1 bloqueo, y batallo contra una oleada, el daño producido por la oleada de Minions al campeón no sera considerado. Cada bloqueo sirve para una sola batalla.

Los campeones pueden equiparse o desequiparse Items. Esto tiene dos consecuencias:
1. los items al ser equipados o desequipados en el campeón, producen un efecto en el campeón (que puede ser tanto positivo como negativo). 
2. Cada item brinda, al campeón que lo tiene equipado, una cantdiad de puntos de ataque y otra de puntos vida extras. Por lo que debe considerarse, para calcular el ataque o la vida de un campeón, la suma de los puntos base que se indican para este, más los que aportan los items que posee equipados.

Considerar los siguientes items que el campeón podría equiparse:

Anillo de Doran: Aporta 60 puntos de vida y 15 de ataque al campeón quien lo equipe. Al equiparse, el campeón recibe 5 puntos de daño, y al desequiparse, el campeón recupera 10 puntos de daño.

Tomo Amplificador: Aporta el 25% de los puntos de daño total recibido por el campeon como puntos de vida y el 5% como puntos de ataque. Al equiparse otorga una dos bloqueo al campeón pero al desequiparse, otorga 1 bloqueo y recibe 30 puntos de daño.

Sombrero de Rabadon: Es una variante del Tomo Amplificador. Aporta 5 puntos más de vida que lo que aporta un Tomo Amplificador, y el doble de los puntos de ataque base del campeón (o sea, algo distinto de lo que corresponde al Tomo Amplificador). Al equiparse, hace lo mismo que un Tomo Amplificador pero el campeón ademas recibe 5 puntos extra de daño. Al desequiparse, no hace nada.


Las oleadas de Minions, están conformadas por la cantidad de Minions que la conforma, no es necesario considerar al Minion como un objeto individual. Estos solo saben defenderse de un ataque, por lo que cada vez que reciben el ataque de un campeon, estos devuelven el daño provocado al defenderse de este. El daño que producen es igual al numero de Minions que conforma la oleada, mas un plus que varia de oleada en oleada.


Realizar como mínimo el siguiente test:

* Crear un campeon con 50 puntos de vida y 15 de ataque. Crear una Oleada de 10 Minions, con un plus de 5 puntos de daño. Luego, Equiparse un anillo de Doran y un Tomo Amplificador. Que el campeon ataque a la Oleada de Minions y finalmente que el campeón se desequipe el Tomo Amplificador. Probar que el campeón esta muerto tras haberse desequipado el tomo.
