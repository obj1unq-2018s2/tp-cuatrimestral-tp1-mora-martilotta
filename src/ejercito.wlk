import campeon.*

class EjercitoDeMinions {

	const property oleadas = []

	method agregar(oleada) {
		oleadas.add(oleada)
	}

	method eliminar(oleada) {
		oleadas.remove(oleada)
	}

	method estaMuerto() {
		return oleadas.all{ oleada => oleada.estaMuerto() }
	}

	method esDaniadoCon(cantidad) {
		oleadas.forEach{ oleada => oleada.esDaniadoCon(cantidad)}
	}

	method recibirAtaque(alguien) {
		alguien.recibirAtaque(self)
		self.esDaniadoCon(alguien.puntosDeAtaqueTotales())
	}

	method puntosDeAtaqueTotales() {
		return oleadas.sum{ oleada => oleada.puntosDeAtaqueTotales() }
	}

	method minions() {
		return oleadas.sum{ oleada => oleada.minions() }
	}

}
