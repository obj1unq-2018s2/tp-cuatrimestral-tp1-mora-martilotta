class Item {

	/*
	 * Incluye los métodos principales que un ítem debe poseer.
	 * (estos les asignaran sus propios valores de acuerdo a sus características).
	 */
	 
	method puntosDeVidaQueOtorga(campeon) {
		return 0
	}

	method puntosDeAtaqueQueOtorga(campeon) {
		return 0
	}

	method equipar(campeon) {}

	method desequipar(campeon) {}

	method habilidadActivable(campeon) {}

	method precio() {
		return 0
	}

}

class AnilloDeDoran inherits Item {

	override method puntosDeVidaQueOtorga(campeon){
		return 60
	}

	override method puntosDeAtaqueQueOtorga(campeon){
		return 15
	}

	override method equipar(campeon) {
	// El campeón recibe 5 puntos de daño
	
		campeon.esDaniadoCon(5)
	}

	override method desequipar(campeon) {
	// El campeón pierde 10 puntos de daño
	
		campeon.recuperaDanioCon(10)
	}

	// PARTE 2
	
	override method precio() {
		return 300
	}

}

class TomoAmplificador inherits Item {

	var property usos = 0 // Número que indica la cantidad de veces que se uso la habilidad activable.


	override method puntosDeVidaQueOtorga(campeon) {
	// Aporta el 25 % de los puntos de danioRecibido del campeón.
	
		return campeon.danioRecibido() * 25 / 100
	}

	override method puntosDeAtaqueQueOtorga(campeon) {
	// Aporta el 5 % de los puntos de daño actuales del campeón.
	
		return campeon.danioRecibido() * 5 / 100
	}

	override method equipar(campeon) {
	// Los bloqueos del campeón se incrementan en 2 unidades.
		
		campeon.cantBloqueos(2)
	}

	override method desequipar(campeon) {
	/* 
	 * Los bloqueos del campeón se incrementan en una unidad, 
	 * y los puntos de daño en 30 
	 */
		campeon.cantBloqueos(1)
		campeon.esDaniadoCon(30)
	}

	// Metodos de la Parte II
	
	override method precio() {
		return 500
	}

	method usosTotales() {
	// Devuelve el número de veces que puede utilizarse la habilidad activable.
		return 1
	}

	override method habilidadActivable(campeon) {
		if (campeon.dinero() < 500 && usos < self.usosTotales()) {
			campeon.dinero(500)
			usos += 1
		}
	}
}


class SombreroDeRabadon inherits TomoAmplificador {

	override method puntosDeVidaQueOtorga(campeon) {
	/*
	 * Aporta los mismos puntos de vida que el Tomo Amplificador
	 * más cinco unidades.
	 */
		return super(campeon) + 5
	}

	override method puntosDeAtaqueQueOtorga(campeon) {
	// Aporta el doble de los puntos de ataque base del campeón.
	 
		return campeon.puntosDeAtaque() * 2
	}

	override method equipar(campeon) {
	/*
	 * Tiene los mismos efectos que el Tomo Amplificador. Además 
	 * el campeon recibe 5 puntos extra de danio.
	 */
		super(campeon)
		campeon.esDaniadoCon(5)
	}

	override method desequipar(campeon) {
	// El sombrero no ocasiona efecto alguno al desequiparse.
	}


	// Metodos de la Parte II
	
	override method precio() {
	// Devuelve el mismo precio que el tomo más 100 de valor agregado.
		
		return super() + 100
	}
	
	//override method habilidadActivable(campeon) {
	// El sombrero no posee habilidad activable.
	//}
}

// PARTE 2: Nuevos Items.

class PocionDeVida inherits Item {

	var property usos = 0 // Número que indica la cantidad de veces que se uso la habilidad activable.

	override method precio() {
		return 50
	}

	method usosTotales(){
	// Devuelve el número de veces que puede utilizarse la habilidad activable.	
		return 2
	}

	override method habilidadActivable(campeon) {
		if (usos < self.usosTotales()) {
			campeon.recuperaDanioCon(50)
			usos += 1
		}
	}
}
