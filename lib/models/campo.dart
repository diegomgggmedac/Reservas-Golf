class Campo {
  final String id;
  final String nombre;
  final String ciudad;
  final int hoyos;
  final int precio;
  final bool activo;

  Campo({
    required this.id,
    required this.nombre,
    required this.ciudad,
    required this.hoyos,
    required this.precio,
    required this.activo,
  });

  factory Campo.fromFirestore(String id, Map<String, dynamic> data) {
    return Campo(
      id: id,
      nombre: data['nombre'] ?? '',
      ciudad: data['ciudad'] ?? '',
      hoyos: data['hoyos'] ?? 0,
      precio: data['precio'] ?? 0,
      activo: data['activo'] ?? false,
    );
  }
}
