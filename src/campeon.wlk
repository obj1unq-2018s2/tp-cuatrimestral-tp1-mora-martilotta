class Campeon {
	
	const property puntosDeAtaque // Es un número.
	const property puntosDeVida   // Es un número.
	var property danioRecibido = 0
	var property cantBloqueos  = 0
	const property items = []
	
	method estaMuerto() = danioRecibido >= self.puntosDeVidaTotales()
	
	
	method danioRecibido(cantidad){
		//Aumenta el valor danioRecibido en "cantidad" unidades.
		danioRecibido += cantidad
	}
	
	
	method cantBloqueos(cantidad){
		//Aumenta los bloqueos en "cantidad" unidades.
		cantBloqueos += cantidad
	}
	
	
	method atacar(alguien) {
		//Se ataca a alguien y se aplican los métodos correspondientes.
		alguien.recibirAtaque(self)
	}


	method recibirAtaque(alguien) {
		/*
		 * Si el campeón tiene algún bloqueo, éste se reduce en una unidad.
		 * Si no tiene, se suma el ataque de alguien al danioRecibido.
		 */
		if (cantBloqueos > 0) {
			cantBloqueos -= 1
		} else {
			danioRecibido += alguien.ataqueTotal()
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
	
	
	method puntosDeVidaExtra() {
		/*
		 * Devuelve la suma de todos los puntos de vida extra 
		 * que otorga cada ítem equipado.
		 */
		return items.sum{item => item.puntosDeVidaQueOtorga(self)}
	}
	
		
	method puntosDeAtaqueExtra() { 
		/*
		 * Devuelve la suma de todos los puntos de ataque extra
		 * que otorga cada ítem equipado.
		 */
		return items.sum{item => item.puntosDeAtaqueQueOtorga(self)}
	}


	method puntosDeVidaTotales() { 
		/*
		 * Devuelve la suma de los puntos de vida originales del campeón
		 * más los puntos de vida extra.
		 */
		return self.puntosDeVidaExtra() + puntosDeVida	
	}
	
		
	method puntosDeAtaqueTotales() {
		/*
		 * Devuelve la suma de los puntos de ataque originales del campeón
		 * más los puntos de ataque extra.
		 */	
		return self.puntosDeAtaqueExtra() + puntosDeAtaque
	}
}


class Oleada {
	/*
	 * Se crea una oleada de enemigos cuyo propósito es atacar al campeón.
	 * Se le establece el valor de la vida, del ataque, y del ataque plus.
	 * Esta oleada es susceptible de recibir ataques.
	 */
	var property ataque // Es igual a la cantidad de unidades enemigas.
	var property plus   // Es un número.
	var property vida   // Es un número.
	var property danioRecibido = 0
	
	method recibirAtaque(alguien) {
		//Se suma el ataque de alguien al danioRecibido.
		danioRecibido += alguien.puntosDeAtaqueTotales()
		self.atacar(alguien)
	}
	
	
	method ataqueTotal(){ 
		//Devuelve la suma del ataque más el ataque plus.
		return ataque + plus
	}
	
	
	method atacar(alguien){
		//Se ataca a alguien y se aplican los métodos correspondientes.
		alguien.recibirAtaque(self)
	}
}