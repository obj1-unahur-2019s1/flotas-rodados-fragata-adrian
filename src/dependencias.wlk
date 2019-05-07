import rodados.*

class Dependencia{
	var property empleados = 0
	const property flota = [ ]
	
	method agregarAFlota(rodado) { flota.add(rodado) }
	method quitarDeFlota(rodado) { flota.remove(rodado) }
	method pesoTotalFlota() { return flota.sum({rodado => rodado.peso()}) }
	method estaBienEquipada() { return flota.size() >= 3 and flota.all({rodado => rodado.velocidadMaxima() >= 100}) }
	method capacidadTotalEnColor(color) {
		return flota.filter({rodado => rodado.color() == color }).sum({rodado => rodado.capacidad()})
	}
	method colorDelRodadoMasRapido() { 
		return flota.filter({rodado => rodado.velocidadMaxima() }).color()
	}
}