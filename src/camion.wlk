import cosas.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	method pesoTotal() = 1000 + self.pesoCarga()
	method pesoCarga() = cosas.sum({cosa => cosa.peso()})
	method excedidoDePeso() = self.pesoTotal() > 2500
	method objetosPeligrosos(nivel) = cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	method objetosMasPeligrososQue(unaCosa) = cosas.filter({cosa => cosa.nivelDePeligrosidad() > unaCosa.nivelDePeligrosidad()})
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = cosas.all({cosa => cosa.nivelDePeligrosidad() <= nivelMaximoPeligrosidad})
	
	method tieneAlgoQuePesaEntre(min, max) {
		return cosas.any({cosa => (cosa.peso() > min) && (cosa.peso() < max)})
	}
	method cosaMasPesada() = cosas.max({cosa => cosa.peso()})
	method totalBultos() = cosas.sum({cosa => cosa.bultos()})
	method pesos() = cosas.map({cosa => cosa.peso()})
}
