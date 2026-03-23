import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reservas Golf',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const CamposPage(),
    );
  }
}

class CamposPage extends StatelessWidget {
  const CamposPage({super.key});

  Future<void> crearReserva({
    required BuildContext context,
    required String campoId,
    required String campoNombre,
    required int precio,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('reservas').add({
        'campoId': campoId,
        'campoNombre': campoNombre,
        'usuarioId': 'usuario_prueba_1',
        'usuarioNombre': 'Juan',
        'fecha': '2026-03-25',
        'hora': '10:00',
        'jugadores': 4,
        'estado': 'confirmada',
        'precioTotal': precio,
      });

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Reserva creada en $campoNombre'),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al crear la reserva: $e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final camposStream =
        FirebaseFirestore.instance.collection('campos').snapshots();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Campos de golf'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: camposStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error al cargar los campos'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final docs = snapshot.data?.docs ?? [];

          if (docs.isEmpty) {
            return const Center(
              child: Text('No hay campos disponibles'),
            );
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data() as Map<String, dynamic>;

              final nombre = data['nombre'] ?? 'Sin nombre';
              final ciudad = data['ciudad'] ?? 'Sin ciudad';
              final hoyos = data['hoyos'] ?? 0;
              final precio = (data['precio'] ?? 0) as int;
              final activo = data['activo'] ?? false;

              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: ListTile(
                  title: Text(nombre),
                  subtitle: Text('$ciudad • $hoyos hoyos'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('$precio €'),
                      Text(
                        activo ? 'Disponible' : 'No disponible',
                        style: TextStyle(
                          fontSize: 12,
                          color: activo ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    crearReserva(
                      context: context,
                      campoId: doc.id,
                      campoNombre: nombre,
                      precio: precio,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}