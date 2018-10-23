class Campeon {
	const property puntosDeAtaque
	const property puntosDeVida
	var property danioRecibido
	var property cantBloqueos
	const property items = []
	
	method estaMuerto() = danioRecibido >= self.puntosDeVidaTotal()
	
	method atacar(alguien) {
		alguien.recibirAtaque(self)
	}

	method recibirAtaque(alguien) {
		if (cantBloqueos > 0) {
			cantBloqueos -= 1
		} else {
			danioRecibido += alguien.ataque()
		}
	}
	method equipar(item) {
		items.add(item)
		item.equipar(self)
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
	var property danioRecibido
	method recibirAtaque(alguien) {
		danioRecibido += alguien.puntosDeAtaqueTotal()
		self.atacar(alguien)
	}
	method atacar(alguien){
		alguien.recibirAtaque(self)
	}
}