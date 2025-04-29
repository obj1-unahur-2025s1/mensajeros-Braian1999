object mensajeria {
  var mensajeros = #{neo}
  method mensajeros() = mensajeros
  method contratarMensajero(nuevoMensajero) { self.mensajeros().add(nuevoMensajero)}
  method despedirMensajero(unMensajero) {self.mensajeros().remove(unMensajero)}
  method despedirATodos() {self.mensajeros().removeAll()}
  method esGrandeLaMensajeria() = self.mensajeros().size()
  method elPrimeroPuedeEntregarElPaquete(destino) = paquete.puedeSerEntregado(self.mensajeros().asList().first(), destino)
  method elPesoDelUltimoMensajero() = self.mensajeros().asList().last().peso()
}


// PAQUETES
object paquete {
  var estaPago = false
  method estaPago() = estaPago
  method estaPago(booleano) {estaPago = booleano }
  method puedeSerEntregado(unMensajero, destino) = estaPago && destino.puedePasar(unMensajero)
}
object paquetito {
  method estaPago() = true
}

// DESTINOS
object puenteDeBrooklyn {
  method puedePasar(unMensajero) = unMensajero.peso().between(0, 1000)
}

object laMatrix {
  method puedePasar(unMensajero) = unMensajero.puedeLlamar()
}

// MENSAJEROS
object roberto {
  var peso = 90
  var transporte = null

  method peso() = peso + transporte.peso()
  method peso(unPeso) {peso = unPeso}

  method transporte() = transporte
  method transporte(untransporte) {transporte = untransporte}
  
  method puedeLlamar() = false
}

object chuckNorris {
method peso() = 80
method puedeLlamar() = true
}

object neo {
  var puedeLlamar = false 

  method peso() = 0
  method puedeLlamar() = puedeLlamar
  method puedeLlamar(bool) {puedeLlamar = bool}
} 

// TRANSPORTES
object bicicleta {
  method peso() = 5
}

object camion {
  var acoplado = null
  
  method peso() = acoplado * 500
  method acoplado(unNumero) {acoplado = unNumero}
} 

