enum EstadoReserva {
  pendiente, // 0
  confirmado, // 1
  cancelado, // 2
  terminado, // 3
}

EstadoReserva estadoDesdeInt(int value) {
  return EstadoReserva.values[value];
}

int estadoAInt(EstadoReserva estado) {
  return estado.index;
}

String textoEstado(EstadoReserva estado) {
  switch (estado) {
    case EstadoReserva.pendiente:
      return 'Pendiente';
    case EstadoReserva.confirmado:
      return 'Confirmado';
    case EstadoReserva.cancelado:
      return 'Cancelado';
    case EstadoReserva.terminado:
      return 'Terminado';
  }
}

class Reserva {
  final String id;
  final String campoId;
  final String campoNombre;
  final String usuarioId;
  final String usuarioNombre;
  final DateTime fechaHora;
  final int jugadores;
  final int precioTotal;
  final EstadoReserva estado;

  Reserva({
    required this.id,
    required this.campoId,
    required this.campoNombre,
    required this.usuarioId,
    required this.usuarioNombre,
    required this.fechaHora,
    required this.jugadores,
    required this.precioTotal,
    required this.estado,
  });

  factory Reserva.fromFirestore(String id, Map<String, dynamic> data) {
    return Reserva(
      id: id,
      campoId: data['campoId'] ?? '',
      campoNombre: data['campoNombre'] ?? '',
      usuarioId: data['usuarioId'] ?? '',
      usuarioNombre: data['usuarioNombre'] ?? '',
      fechaHora: (data['fechaHora'] as dynamic).toDate(),
      jugadores: data['jugadores'] ?? 0,
      precioTotal: data['precioTotal'] ?? 0,
      estado: estadoDesdeInt(data['estado'] ?? 0),
    );
  }
}
