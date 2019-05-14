import rodados.*

class Pedido {
	
	var property distancia = 0
	var property tiempoMaximo = 0
	var property pasajeros = 0
	var property coloresIncompatibles = #{ }
	
	method velocidadRequerida(){ return distancia / tiempoMaximo }
	method acelerar(){ tiempoMaximo -= 1 }
	method relajar(){ tiempoMaximo += 1 }
	method puedeSatisfacer(auto){
		return auto.velocidadMaxima() >= self.velocidadRequerida() + 10 
			and auto.capacidad() >= pasajeros 
			and coloresIncompatibles.all({color => color != auto.color()})
			// not coloresIncompaticles.contains(auto.color())
	}
	
}
