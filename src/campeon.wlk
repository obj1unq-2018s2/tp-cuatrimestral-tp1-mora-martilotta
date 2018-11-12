class Campeon {

	const property puntosDeAtaque = 0
	const property puntosDeVida = 0
	var   property danioRecibido = 0
	var   property cantBloqueos = 0
	const property items = []
	var   property dinero = 0

	method estaMuerto() {
		/*
		 * Devuelve TRUE cuando el Personaje pierde la vida. Es decir,
		 * cuando el daño recibido es mayor a los puntos de vida totales.
		 */
		return danioRecibido >= self.puntosDeVidaTotales()
	}

	method esDaniadoCon(cantidad) {
		// Aumenta el valor danioRecibido en "cantidad" unidades.
		danioRecibido += cantidad
	}

	method recuperaDanioCon(cantidad) {
		danioRecibido = (danioRecibido - cantidad).max(0)
	}

	method atacar(alguien) {
		// Se ataca a alguien y se aplican los métodos correspondientes.
		dinero += self.dineroObtenidoPorAtaque(alguien)
		alguien.recibirAtaque(self)
	}

	method dineroObtenidoPorAtaque(alguien) {
		return self.puntosDeAtaqueTotales().min(alguien.minions())
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

	method puntosDeVidaExtra() {
		/*
		 * Devuelve la suma de todos los puntos de vida extra 
		 * que otorga cada ítem equipado.
		 */
		return items.sum{ item => item.puntosDeVidaQueOtorga(self) }
	}

	method puntosDeAtaqueExtra() {
		/*
		 * Devuelve la suma de todos los puntos de ataque extra
		 * que otorga cada ítem equipado.
		 */
		return items.sum{ item => item.puntosDeAtaqueQueOtorga(self) }
	}

	method recibirAtaque(alguien) {
		/*
		 * Si el campeón tiene algún bloqueo, éste se reduce en una unidad.
		 * Si no tiene, se suma el ataque de alguien al danioRecibido.
		 */
		if (cantBloqueos > 0 && !alguien.estaMuerto()) {
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

	method comprar(item) {
		if (self.puedeComprar(item)) {
			self.equiparseUn(item)
			dinero -= item.precio()
		} else {
			self.error("Te faltan " + self.dineroFaltanteParaComprar(item) + " para comprar este item!")
		}
	}

	method dineroFaltanteParaComprar(item) {
		return item.precio() - dinero
	}

	method vender(item) {
		self.desequiparseUn(item)
		dinero += item.precio() / 2
	}

	method puedeComprar(item) {
		return dinero >= item.precio()
	}
	
	method activarHabilidad(item) {
		item.habilidadActivable(self)
	}

}

class Oleada {

	// Se crea una oleada de enemigos cuyo propósito es atacar al campeón.
	var property plus = null // Es un número.
	var property minions

	method recibirAtaque(alguien) {
		alguien.recibirAtaque(self)
		self.esDaniadoCon(alguien.puntosDeAtaqueTotales())
	}

	method esDaniadoCon(cantidad) {
		minions = (minions - cantidad).max(0)
	}

	method estaMuerto() {
		return minions <= 0
	}

	method puntosDeAtaqueTotales() {
		return minions + self.puntosDeAtaqueExtra()
	}

	method puntosDeAtaqueExtra() {
		if (!self.estaMuerto()) {
			return plus
		} else {
			return 0
		}
	}

}

