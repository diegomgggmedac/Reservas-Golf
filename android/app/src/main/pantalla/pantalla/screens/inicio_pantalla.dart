import 'package:flutter/material.dart';
//C:\Users\ruizc\develop\app_golf\lib\pantalla\menuaplication.dart
import '../menuaplication.dart';
class PantallaLogin extends StatelessWidget {
  const PantallaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  // AQUÍ ESTÁ EL FONDO
                  image: AssetImage("assets/images/golf.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black54,
                    BlendMode.darken,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 50),

                    // =====================================
                    // --- AQUÍ ESTÁ EL LOGO CORREGIDO ---
                    // Usamos Image.asset para archivos PNG
                    // =====================================
                    Image.asset(
                      'assets/images/logo.png', // Asegúrate de que tu archivo se llama exactamente así
                      width: 120,
                      height: 120,
                    ),

                    const SizedBox(height: 20),

                    // --- ETIQUETA: USUARIO ---
                    Container(
                      width: 220,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2E2E2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person, color: Colors.black, size: 24),
                          SizedBox(width: 10),
                          Text(
                            'Usuario',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    // --- INPUT: USUARIO ---
                    const SizedBox(
                      width: 240,
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        decoration: InputDecoration(
                          hintText: 'Usuario',
                          hintStyle: TextStyle(
                            color: Colors.white54,
                            fontSize: 18,
                          ),
                          filled: true,
                          fillColor: Colors.white12,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // --- ETIQUETA: CONTRASEÑA ---
                    Container(
                      width: 220,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2E2E2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.share, color: Colors.black, size: 22),
                          SizedBox(width: 10),
                          Text(
                            'Contraseña',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    // --- INPUT: CONTRASEÑA ---
                    const SizedBox(
                      width: 240,
                      child: TextField(
                        textAlign: TextAlign.center,
                        obscureText: true,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          hintStyle: TextStyle(
                            color: Colors.white54,
                            fontSize: 18,
                          ),
                          filled: true,
                          fillColor: Colors.white12,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // --- BOTONES: LIMPIAR / ENTRAR ---
                    Container(
                      width: 200,
                      height: 45,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Material(
                              color: const Color(0xFFE52E2D),
                              child: InkWell(
                                onTap: () {},
                                child: const Center(
                                  child: Text(
                                    'Limpiar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Material(
                              color: const Color(0xFF455480),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MenuAplicacion(),
                                    ),
                                  );
                                },
                                child: const Center(
                                  child: Text(
                                    'Entrar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),

          // ==========================================
          // ZONA INFERIOR: FOOTER AZUL FIJO
          // ==========================================
          Container(
            width: double.infinity,

            decoration: BoxDecoration(
              color: const Color.fromARGB(180, 94, 0, 171),
            ),

            padding: const EdgeInsets.symmetric(vertical: 35),
            child: const Column(
              children: [
                Text(
                  '¿Olvidaste la contraseña?',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(height: 12),
                Text(
                  'Reestablecer contraseña',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
