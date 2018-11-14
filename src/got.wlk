class Personaje {

	var property nombre
	var property casa
	var property conyugues = #{}
	var property acompaniantes = #{}
	var property vivo = true
	var property monedas = 0
	var personalidad
	
	method estaSoltero() {
		return conyugues.size() == 0
	}
	
	method sePuedeCasarCon(personaje) {
		return casa.puedeCasarse(self, personaje) && personaje.casa().puedeCasarse(personaje, self)
	}
	
	method casarseCon(personaje) {
		self.cumpleCondicionesCasa(personaje)
		conyugues.add(personaje)
		personaje.conyugues().add(self)
	}
	
	method cumpleCondicionesCasa(personaje) {
		if (!self.sePuedeCasarCon(personaje)){
			throw new Exception("No se puede casa con el personaje")
		}
	}
	
	method patrimonio() {
		return casa.patrimonio() / casa.cantidadDeMiembros()
	}
	
	method estaSolo() {
		return acompaniantes.size() == 0
	}
	
	method aliados() {
		return self.acompaniantes() + conyugues + casa.miembros()
	}
	
	method peligroso() {
		self.estaConVida()
		return self.aliadosMillonarios() || self.conyuguesDeCasasRicas() || self.alianzaPeligrosa()
	}
	
	method estaConVida() {
		if (!vivo){
			throw new Exception("El personaje esta muerto")
		}
	}
	
	method aliadosMillonarios() {
		return self.aliados().sum({aliado => aliado.monedas()}) > 10000
	}
	
	method conyuguesDeCasasRicas() {
		return conyugues.all({conyugue => conyugue.casa().esRica()})
	}
	
	method alianzaPeligrosa() {
		return self.aliados().any({aliado => aliado.peligroso()})
	}
	
	method accionConspirativa(victima) {
		personalidad.atacar(victima)
	}
	
	method morir() = self.vivo(false)
	
	method derrochar(porcentajeDerrochado) {
		casa.derrocharPatrimonio(porcentajeDerrochado)
	}

}

class Animal {
	
	method monedas() = 0
	
}

class Dragon inherits Animal {
	
	method peligroso() {
		return true
	}
	
}

class Lobo inherits Animal {
	var tipo = huargo
	
	method peligroso() {
		return tipo.equals(huargo)
	}
	
}

object huargo {
	
}

class Conspiracion {
	
	var complotados = #{}
	var victima
	var complotCumplido = false
	
	constructor(_victima, _complotados){
		self.complotPosible(_victima)
		victima = _victima
		complotados.union(_complotados)
	}
	
	method complotPosible(_victima) {
		if (_victima.nombre() == "Hodor" || !_victima.peligroso()){
			throw new Exception ("No se puede complotar contra la victima")
		}
	}
	
	method traidores() {
		return complotados.forEach({complotado => victima.aliados().contains(complotado)})
	}
	
	method cantidadTraidores() {
		return self.traidores().size()
	}
	
	method ejecutarConspiracion() {
		complotados.map({complotado => complotado.accionConspirativa(victima)})
		complotCumplido = true
	}
	
	method seCumplio() = complotCumplido && victima.peligroso()
}
