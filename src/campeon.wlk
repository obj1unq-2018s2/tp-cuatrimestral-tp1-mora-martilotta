class Personaje {
	
	/*
	 * Consideramos que para esta primer etapa y probablemente para las proximas
	 * estos atributos y metodos van a ser iguales para cualquier nuevo personaje.
	 * Por este motivo lo modelamos como superclase
	 */
	const property puntosDeAtaque = null // Es un número.
	const property puntosDeVida = null // Es un número.
	var property danioRecibido = 0

	method estaMuerto() = danioRecibido >= self.puntosDeVidaTotales()
		/*
		 * Devuelve TRUE cuando el Personaje pierde la vida. Es decir,
		 * cuando el daño recibido es mayor a los puntos de vida totales.
		 */

	method esDaniadoCon(cantidad) {
		// Aumenta el valor danioRecibido en "cantidad" unidades.
		danioRecibido += cantidad
	}

	method atacar(alguien) {
		// Se ataca a alguien y se aplican los métodos correspondientes.
		alguien.recibirAtaque(self)
	}

	method puntosDeAtaqueTotales() {
		/*
		 * Devuelve la suma de los puntos de ataque originales del personaje
		 * más los puntos de ataque extra.
		 */
		return self.puntosDeAtaqueExtra() + puntosDeAtaque
	}

	method puntosDeVidaTotales() {
		/*
		 * Devuelve la suma de los puntos de vida originales del personaje
		 * más los puntos de vida extra.
		 */
		return self.puntosDeVidaExtra() + puntosDeVida
	}

	method puntosDeAtaqueExtra()

	method puntosDeVidaExtra()

}

class Campeon inherits Personaje {

	var property cantBloqueos = 0
	const property items = []

	method recibirAtaque(alguien) {
		/*
		 * Si el campeón tiene algún bloqueo, éste se reduce en una unidad.
		 * Si no tiene, se suma el ataque de alguien al danioRecibido.
		 */
		if (cantBloqueos > 0) {
			cantBloqueos -= 1
		} else {
			danioRecibido += alguien.puntosDeAtaqueTotales()
		}
	}

	method equiparseUn(item) {
		/*
		 * Agrega a la lista de ítems del campeón el ítem nuevo.
		 * Luego, se lo equipa y se aplican los efectos correspondientes.
		 */
		items.add(item)
		item.equipar(self)
	}

	method desequiparseUn(item) {
		/*
		 * Remueve de la lista de ítems del campeón el ítem especificado.
		 * Luego, se lo desequipa y se aplican los efectos de tal acción.
		 */
		items.remove(item)
		item.desequipar(self)
	}

	override method puntosDeVidaExtra() {
		/*
		 * Devuelve la suma de todos los puntos de vida extra 
		 * que otorga cada ítem equipado.
		 */
		return items.sum{ item => item.puntosDeVidaQueOtorga(self) }
	}

	override method puntosDeAtaqueExtra() {
		/*
		 * Devuelve la suma de todos los puntos de ataque extra
		 * que otorga cada ítem equipado.
		 */
		return items.sum{ item => item.puntosDeAtaqueQueOtorga(self) }
	}

}

class Oleada inherits Personaje {

	// Se crea una oleada de enemigos cuyo propósito es atacar al campeón.
	
	var property plus = null // Es un número.

	method recibirAtaque(alguien) {
		// Se suma el ataque de alguien al danioRecibido.
		danioRecibido += alguien.puntosDeAtaqueTotales()
		self.atacar(alguien)
	}
	
	override method puntosDeAtaqueExtra() {
		//Habilidad que solo posee la Oleada y que consiste en un daño adicional.
		return plus 
	}

	override method puntosDeVidaExtra() {
		// La oleada no tiene puntos de vida extra
		return 0
	}

}

