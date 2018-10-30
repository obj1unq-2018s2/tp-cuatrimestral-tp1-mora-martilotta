class Item {/*
 * Incluye los métodos principales que un ítem debe poseer.
 * (estos les asignaran sus propios valores de acuerdo a sus características).
 */
	var property usosHabilidadActivable = 0 // Es un número
	var property valor = 0 // Es un número que indica el valor del producto, que sirve al método "precio"
	method puntosDeVidaQueOtorga(campeon)
	method puntosDeAtaqueQueOtorga(campeon) 
	method equipar(campeon)	   
	method desequipar(campeon)	
	
	method habilidadActivable(campeon)
	method usosHabilidad() //Permite modificar la vavriable usosHabilidadActivable de acuerdo al nro recibido.
	method precio()
	
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
	
	// PARTE 2
	
	
	override method precio() {
		/*
		 * Este método devuelve el valor del producto. Notar que si el valor del producto cambia, 
		 * el precio también lo hará.
		 */
		valor = 300
		return valor
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
    
    // PARTE 2
    
	override method precio() {
		/*
		 * Este método devuelve el valor del producto. Notar que si el valor del producto cambia, 
		 * el precio también lo hará.
		 */
		valor = 500
		return valor
	}
	
	override method usosHabilidad(){
		usosHabilidadActivable = 1
	}
    
    override method habilidadActivable(campeon) {
    	if (campeon.dinero() < 500 && usosHabilidadActivable < 1) {
    		campeon.dinero(500)
    		usosHabilidadActivable -= 1
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
	
	// PARTE 2
	
	override method precio() {
		// Devuelve el mismo precio que el tomo más 100 de valor agregado.
		return super() + 100
	}
	
	override method usosHabilidad(){
		// No hace nada, ya que el sombrero no tiene habilidadActivable
	}
	
	override method habilidadActivable(campeon) {
		// No hace nada, ya que el sombrero no tiene habilidad activable.
	}
}




class PocionDeVida inherits Item {
	
	override method precio() {
		valor = 50
		return valor
	}
	
	override method usosHabilidad() = 2

	override method habilidadActivable(campeon) {
		
		if (usosHabilidadActivable < 2) {
			campeon.recuperaDanioCon(50)
			usosHabilidadActivable += 1
		}
	}
}