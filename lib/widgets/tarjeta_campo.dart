import 'package:flutter/material.dart';
import '../models/campo.dart';

class TarjetaCampo extends StatelessWidget {
  final Campo campo;
  final VoidCallback onTap;

  const TarjetaCampo({
    super.key,
    required this.campo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        title: Text(campo.nombre),
        subtitle: Text('${campo.ciudad} • ${campo.hoyos} hoyos'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${campo.precio} €'),
            Text(
              campo.activo ? 'Disponible' : 'No disponible',
              style: TextStyle(
                fontSize: 12,
                color: campo.activo ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}