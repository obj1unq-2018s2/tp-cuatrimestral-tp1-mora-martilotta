class Campeon {
	const property puntosDeAtaque
	const property puntosDeVida
	var property danioRecibido = 0
	var property cantBloqueos = 0
	const property items = []
	
	method estaMuerto() = danioRecibido >= self.puntosDeVidaTotal()
	
	method atacar(alguien) {
		alguien.recibirAtaque(self)
	}

	method recibirAtaque(alguien) {
		if (cantBloqueos > 0) {
			cantBloqueos -= 1
		} else {
			danioRecibido += alguien.ataqueTotal()
		}
	}
	method equiparseUn(item) {
		items.add(item)
		item.equipar(self)
	}
	
	method desequiparseUn(item) {
		items.remove(item)
		item.desequipar(self)
	}
	
	method puntosDeVidaExtra() = items.sum{item => item.puntosDeVidaQueOtorga(self)}
	method puntosDeAtaqueExtra() = items.sum{item => item.puntosDeAtaqueQueOtorga(self)}
	method puntosDeVidaTotal() = self.puntosDeVidaExtra() + puntosDeVida
	method puntosDeAtaqueTotal() = self.puntosDeAtaqueExtra() + puntosDeAtaque

}

class Oleada {
	var property ataque // cantMinions
	var property plus
	var property vida
	var property danioRecibido = 0
	method recibirAtaque(alguien) {
		danioRecibido += alguien.puntosDeAtaqueTotal()
		self.atacar(alguien)
	}
	method ataqueTotal() = ataque + plus
	method atacar(alguien){
		alguien.recibirAtaque(self)
	}
}