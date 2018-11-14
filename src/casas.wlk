class Casa {
	var patrimonio
	var ciudad
	var property miembros = #{}
	
	method esRica() {
		return patrimonio > 1000
	}
	
	method cantidadDeMiembros() {
		return miembros.size()
	}
	
	method derrocharPatrimonio(porcentajeDerrochado) {
		patrimonio = patrimonio - patrimonio * porcentajeDerrochado / 100
	}
}

object casaLannister inherits Casa {

	method puedeCasarse(persona1, persona2) {
		return persona1.estaSoltero() && persona2.estaSoltero()
	}

}

object casaStark inherits Casa {
	
	method puedeCasarse(persona1, persona2) {
		return persona1.casa().equals(persona2.casa())
	}

}

object casaGuardiaNoche inherits Casa {
	
	method puedeCasarse(persona1, persona2) {
		return false
	}

}