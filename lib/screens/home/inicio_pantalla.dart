import 'package:flutter/material.dart';
import '../../widgets/tarjeta_campo.dart';
import '../../models/campo.dart';
import '../../services/campo_servicio.dart';
import '../../services/reservas_servicio.dart';

class InicioPantalla extends StatelessWidget {
  const InicioPantalla({super.key});

  Future<void> _crearReserva(
    BuildContext context,
    Campo campo,
  ) async {
    final reservaServicio = ReservaServicio();

    try {
      await reservaServicio.crearReserva(
         campoId: campo.id,
         campoNombre: campo.nombre,
         usuarioId: '123',
         usuarioNombre: 'Juan',
         fechaHora: DateTime.now(),
         jugadores: 4,
        precioTotal: campo.precio,
);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Reserva creada en ${campo.nombre}'),
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
    final campoServicio = CampoServicio();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Campos de golf'),
      ),
      body: StreamBuilder<List<Campo>>(
        stream: campoServicio.obtenerCampos(),
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

          final campos = snapshot.data ?? [];

          if (campos.isEmpty) {
            return const Center(
              child: Text('No hay campos disponibles'),
            );
          }

          return ListView.builder(
            itemCount: campos.length,
            itemBuilder: (context, index) {
              final campo = campos[index];

              return TarjetaCampo(
                campo: campo,
                onTap: () => _crearReserva(context, campo),
              );
            },
          );
        },
      ),
    );
  }
}