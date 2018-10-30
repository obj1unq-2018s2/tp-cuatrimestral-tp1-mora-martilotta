class Item {/*
 * Incluye los métodos principales que un ítem debe poseer.
 * (estos les asignaran sus propios valores de acuerdo a sus características).
 */
	var property usosHabilidadActivable
	method puntosDeVidaQueOtorga(campeon)
	method puntosDeAtaqueQueOtorga(campeon) 
	method equipar(campeon)	   
	method desequipar(campeon)	
	method precio()
	method habilidadActivable(campeon)
}


class AnilloDeDoran inherits Item {
	
	override method puntosDeVidaQueOtorga(campeon) = 60
	override method puntosDeAtaqueQueOtorga(campeon) = 15

	override method equipar(campeon){
		//El campeón recibe 5 puntos de daño
		campeon.esDaniadoCon(5)
	}
	
	override method desequipar(campeon){
		//El campeón pierde 10 puntos de daño
		campeon.esDaniadoCon(-10)
	}
	
	override method precio() {
		return 300
	}
}

class TomoAmplificador inherits Item {
	
	override method puntosDeVidaQueOtorga(campeon){ 
		//Aporta el 25 % de los puntos de danioRecibido del campeón
		return campeon.danioRecibido() * 25 / 100
	}
	
	override method puntosDeAtaqueQueOtorga(campeon){
		//Aporta el 5 % de los puntos de daño actuales del campeón
		return campeon.danioRecibido() * 5 / 100
	}
	
	override method equipar(campeon){
		//Los bloqueos del campeón se incrementan en 2 unidades.
		campeon.cantBloqueos(2)
	}
	
	override method desequipar(campeon){
		/* 
		 * Los bloqueos del campeón se incrementan en una unidad, 
		 * y los puntos de daño en 30 
		 */		 
		campeon.cantBloqueos(1)
		campeon.esDaniadoCon(30)
    }
    
    override method precio() {
    	return 500
    }
    
    override method habilidadActivable(campeon) {
    	if (campeon.dinero() < 500 && usosHabilidadActivable < 1) {
    		campeon.dinero(500)
    		usosHabilidadActivable += 1
    	}
    }
}


class SombreroDeRabadon inherits TomoAmplificador {
	
	override method puntosDeVidaQueOtorga(campeon){
		/*
		 * Aporta los mismos puntos de vida que el Tomo Amplificador
		 * más cinco unidades.
		 */
		return super(campeon) + 5
	}
	
	override method puntosDeAtaqueQueOtorga(campeon){
		/*
		 * Aporta el doble de los puntos de ataque base del campeon
		 */
		return campeon.puntosDeAtaque() * 2
	}
	
	override method equipar(campeon){
		/*
		 * Tiene los mismos efectos que el Tomo Amplificador. Además 
		 * el campeon recibe 5 puntos extra de danio.
		 */
		super(campeon) 
		campeon.esDaniadoCon(5)
	}
	
	override method desequipar(campeon) {
		
	}
	
	override method precio() {
		return super() + 100
	}

}

class PocionDeVida inherits Item {
	override method precio() {
		return 50
	}

	override method habilidadActivable(campeon) {
		if (usosHabilidadActivable < 2) {
			campeon.recuperaDanioCon(50)
			usosHabilidadActivable += 1
		}
	}
}