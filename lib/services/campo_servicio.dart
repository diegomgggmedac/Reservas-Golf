import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/campo.dart';

class CampoServicio {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Campo>> obtenerCampos() {
    return _firestore.collection('campos').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Campo.fromFirestore(doc.id, doc.data());
      }).toList();
    });
  }
}