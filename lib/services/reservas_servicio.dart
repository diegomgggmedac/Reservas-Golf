import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/reserva.dart';
class ReservaServicio {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> crearReserva({
    required String campoId,
    required String campoNombre,
    required int precioTotal,
  }) async {
    await _firestore.collection('reservas').add({
      'campoId': campoId,
      'campoNombre': campoNombre,
      'usuarioId': 'usuario_prueba_1',
      'usuarioNombre': 'Juan',
      'fechaHora': Timestamp.fromDate(DateTime(2026, 3, 25, 10, 0)),
      'jugadores': 4,
      'estado': estadoAInt(EstadoReserva.confirmado),
      'precioTotal': precioTotal,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}