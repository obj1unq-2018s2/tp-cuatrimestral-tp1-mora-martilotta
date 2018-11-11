import campeon.*

class Soporte inherits Campeon {

	var property campeonVinculado = null

	override method atacar(alguien) {
		super(alguien)
		campeonVinculado.recuperaDanioCon(10)
	}

	method inventario() = campeonVinculado.items() + self.items()

	override method puntosDeAtaqueExtra() {
		return super() + campeonVinculado.puntosDeAtaqueExtra()
	}

	override method puntosDeVidaExtra() {
		return super() + campeonVinculado.puntosDeVidaExtra()
	}

}

