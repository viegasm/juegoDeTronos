import casas.*

object sutil {
	
	var casas = #{casaLannister, casaStark, casaGuardiaNoche}
	
	method atacar(victima){
		victima.casarseCon(self.casaMasPobre())
	}
	
	method casaMasPobre() {
		return casas.min({casa => casa.patrimonio()})
	}
	
}

object asesino {
	
	method atacar(victima){
		victima.matar()
	}
	
}

object asesinoPrecavido {
	
	method atacar(victima){
		if (victima.estaSolo()){
			victima.morir()
		}
	}
	
}

object disipados {
	
	var porcentajeDerrochado
	
	method atacar(victima){
		victima.derrochar(porcentajeDerrochado)
	}
	
}

object miedosos {
	
	method atacar(victima) {
		
	}
	
}