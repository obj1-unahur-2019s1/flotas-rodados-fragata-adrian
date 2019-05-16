import rodados.*

class Dependencia{
	var property empleados = 0
	const property flota = [ ]
	var property registroPedidos = [ ]
	
	method agregarPedido(pedido) { registroPedidos.add(pedido) }
	method quitarPedido(pedido) { registroPedidos.remove(pedido) }
	
	method agregarAFlota(rodado) { flota.add(rodado) }
	method quitarDeFlota(rodado) { flota.remove(rodado) }
	method pesoTotalFlota() { return flota.sum({rodado => rodado.peso()}) }
	method estaBienEquipada() { return flota.size() >= 3 and flota.all({rodado => rodado.velocidadMaxima() >= 100}) }
	method capacidadTotalEnColor(color) {
		return flota.filter({rodado => rodado.color() == color }).sum({rodado => rodado.capacidad()})
	}
	method colorDelRodadoMasRapido() { 
		return flota.max({rodado => rodado.velocidadMaxima()}).color()
	}
	method capacidadFaltante(){ return empleados - flota.sum({rodado => rodado.capacidad()}) }
	method esGrande(){ return empleados >= 40 and flota.size() >= 5 }
	
	
	
	method totalPasajeros() { return registroPedidos.sum({pedido => pedido.pasajeros() }) }
	
	method pedidosInaceptables(){ 
		return registroPedidos.filter({pedido => not self.puedeSatisfacerPedido(pedido)  })
	}
	
	method puedeSatisfacerPedido(pedido){
		return flota.any({rodado => pedido.puedeSatisfacer(rodado)})
	}
	
	method colorImcompatible(color) { 
		return registroPedidos.all({pedido => pedido .coloresIncompatibles().contains(color) })
	}
	method relajarPedidos() { registroPedidos.forEach({ pedido => pedido.relajar() }) }
}