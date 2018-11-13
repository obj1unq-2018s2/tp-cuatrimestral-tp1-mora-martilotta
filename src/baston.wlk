// Parte individual: Damián Martilotta.

import items.*

class Baston_Del_Vacio inherits Item {
	
	var materiales = [] // Lista de Item que son añadidos al Bastón.
	
	
	method materialesActivos(){
	// Devuelve la lista de ítems equipados del Bastón.
		
		return materiales
	}
	
	method sumarItem(item, campeon){
	// Añade un ítem del campeón a la lista de materiales. Al hacer esto, el campeón se desequipa el ítem.
		
		campeon.desequiparseUn(item)
		materiales.add(item)
	}
			
	override method puntosDeVidaQueOtorga(campeon){
	// Aporta la mitad de los puntos de vida que otorga cada elemento de los materiales.
		
		return materiales.sum {material => material.puntosDeVidaQueOtorga()} / 2
	}
	
	override method puntosDeAtaqueQueOtorga(campeon){
	// Aporta el total de los puntos de ataque que otorga cada elemento de los materiales.
	
		return materiales.sum {material => material.puntosDeAtaqueQueOtorga()}
	}
	
	override method habilidadActivable(campeon){
	// Activa la habilidad activable de cada ítem de los materiales.
		
		materiales.forEach {material => material.habilidadActivable(campeon)}
	}
}

