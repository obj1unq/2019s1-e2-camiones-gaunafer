object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() = 1
	method cargar() {}
}

object bumblebee {
	var transformadoEnAuto = true
	
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bultos() = 2
	method cargar() {transformadoEnAuto = false}
}
object paqueteDeLadrillos {
	var property cantidadDeLadrillos = 0
	method nivelPeligrosidad() { return 2 }
	method peso() = cantidadDeLadrillos * 2
	method bultos() = { 
		if (cantidadDeLadrillos <= 100) {
			return 1
		}
		else if (cantidadDeLadrillos <= 300) {
			return 2
		}
		else {
			return 3
		}
	}
	method cargar() {cantidadDeLadrillos += 12}
}
object arenaAGranel {
	var property peso
	method nivelPeligrosidad() { return 1 }
	method bultos() = 1
	method cargar() {self.peso(self.peso() + 20)}
}
object bateriaAntiaerea {
	var estaConLosMisiles = false
	method cargarMisiles() {estaConLosMisiles = true}
	method descargarMisiles() {estaConLosMisiles= false}
	method nivelPeligrosidad() { return if (estaConLosMisiles) { 100 } else { 0 }  }
	method peso() { return if (estaConLosMisiles) { 300 } else { 200 }  }
	method bultos() { return if(estaConLosMisiles) { 2 } else { 1 } }
	method cargar() {self.cargarMisiles()}
}
object contenedorPortuario {
	var cosas = []
	method cargar(cosa) { cosas.add(cosa)}
	method descargar(cosa) {cosas.remove(cosa) }
	method peso() = 100 + cosas.sum({cosa => cosa.peso()})
	method nivelPeligrosidad() {
		if (cosas.isEmpty()) {
			return 0
		}
		else {
			return cosas.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
		}
	}
	method bultos() = 1 + self.bultosContenidos()
	method bultosContenidos() = cosas.sum({cosa => cosa.bultos()})
	method cargar() {cosas = cosas.map({cosa => cosa.cargar()})}
}
object residuosRadioactivos {
	var property peso
	method nivelPeligrosidad() { return 200 }
	method bultos() = 1
	method cargar() {self.peso(self.peso() + 15)}
}
object embalajeDeSeguridad {
	var objetoEnvuelto
	method envolverObjeto(objeto) { objetoEnvuelto = objeto }
	method peso() = objetoEnvuelto.peso()
	method nivelPeligrosidad() = objetoEnvuelto.nivelPeligrosidad().div(2)
	method bultos() = 2
	method cargar() {}
}
