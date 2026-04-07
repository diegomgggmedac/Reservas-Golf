import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/reserva.dart';
class ReservaServicio {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
}
Future<void> crearReserva({
  required String campoId,
  required String campoNombre,
  required String usuarioId,
  required String usuarioNombre,
  required DateTime fechaHora,
  required int jugadores,
  required int precioTotal,
}) async {
  await _firestore.collection('reservas').add({
    'campoId': campoId,
    'campoNombre': campoNombre,
    'usuarioId': usuarioId,
    'usuarioNombre': usuarioNombre,
    'fechaHora': Timestamp.fromDate(fechaHora),
    'jugadores': jugadores,
    'estado': estadoAInt(EstadoReserva.pendiente),
    'precioTotal': precioTotal,
    'createdAt': FieldValue.serverTimestamp(),
  });
}