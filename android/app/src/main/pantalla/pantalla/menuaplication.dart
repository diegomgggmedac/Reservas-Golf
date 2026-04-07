import 'package:flutter/material.dart';

class MenuAplicacion extends StatelessWidget {
  const MenuAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(
          0xFFF5F5F5,
        ), // Un gris muy clarito y elegante
        appBar: AppBar(
          backgroundColor: const Color(
            0xFF19266E,
          ), // Tu azul oscuro corporativo
          toolbarHeight: 60.0,
          elevation: 0,
          // Añadimos un Row para poner un logo a la izquierda y los tabs a la derecha
          title: Row(
            children: [
              const Image(
                image: AssetImage('assets/images/logo.png'),
                width: 60,
                height: 70,
                color: Colors.white,
                // Ajusta la posición del logo
              ),

              const Spacer(), // Esto empuja los Tabs hacia la derecha del todo

              const TabBar(
                isScrollable: true,
                labelPadding: EdgeInsets.all(30),

                labelColor: Colors.white,
                unselectedLabelColor: Colors.white54,
                tabs: [
                  Tab(text: 'Perfil'),
                  Tab(text: 'Reserva'),
                  Tab(text: 'Mis reservas'),
                  Tab(icon: Icon(Icons.search)),
                ],
              ),
            ],
          ),
        ),

        // Aquí llamamos a los diseños complejos que están más abajo
        body: const TabBarView(
          children: [
            VistaPerfil(),
            VistaReserva(),
            VistaMisReservas(),
            VistaBuscador(),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 1. PESTAÑA: PERFIL
// ==========================================
class VistaPerfil extends StatelessWidget {
  const VistaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 60,
            backgroundColor: Color(0xFFE2E2E2),
            child: Icon(Icons.person, size: 80, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          const Text(
            'Socio Golfer',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Socio #1045',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 40),

          // Opciones de configuración
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.settings, color: Color(0xFF19266E)),
                  title: const Text('Configuración de la cuenta'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.payment, color: Color(0xFF19266E)),
                  title: const Text('Métodos de pago'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.exit_to_app, color: Colors.red),
                  title: const Text(
                    'Cerrar sesión',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    // Aquí podrías hacer un Navigator.pop para volver al Login
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 2. PESTAÑA: RESERVA (Formulario)
// ==========================================
class VistaReserva extends StatelessWidget {
  const VistaReserva({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reserva de los campos ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF19266E),
            ),
          ),
          const SizedBox(height: 20),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Fecha de juego',
                      prefixIcon: Icon(Icons.calendar_month),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Jugadores (1-4)',
                      prefixIcon: Icon(Icons.group),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFFE52E2D,
                        ), // Rojo corporativo
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Buscar Horarios',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 3. PESTAÑA: MIS RESERVAS (Lista de Tarjetas)
// ==========================================
class VistaMisReservas extends StatelessWidget {
  const VistaMisReservas({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        _crearTarjetaReserva(
          'Sábado 15 Oct',
          '09:30 AM',
          'Hoyo 1 al 18',
          'Confirmada',
          Colors.green,
        ),
        _crearTarjetaReserva(
          'Jueves 20 Oct',
          '16:00 PM',
          'Hoyo 1 al 9',
          'Pendiente',
          Colors.orange,
        ),
      ],
    );
  }

  // Un pequeño widget auxiliar para no repetir código
  Widget _crearTarjetaReserva(
    String fecha,
    String hora,
    String hoyos,
    String estado,
    Color colorEstado,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.golf_course, size: 40, color: Color(0xFF19266E)),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fecha,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$hora | $hoyos',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: colorEstado.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                estado,
                style: TextStyle(
                  color: colorEstado,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 4. PESTAÑA: BUSCADOR
// ==========================================
class VistaBuscador extends StatelessWidget {
  const VistaBuscador({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Buscar torneos, socios o noticias...',
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Icon(
            Icons.manage_search,
            size: 100,
            color: Colors.grey.withOpacity(0.3),
          ),
          const Text(
            'Realiza una búsqueda',
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
