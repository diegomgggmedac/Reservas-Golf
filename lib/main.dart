import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home/inicio_pantalla.dart';
import 'services/auth_service.dart';

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
      home: const InicioPantalla(),
    );
  }
}

final authService = AuthService();

// Escuchar cambios de autenticación
StreamBuilder<User?>(
  stream: authService.authStateChanges,
  builder: (context, snapshot) {
    if (snapshot.hasData) return HomeScreen();
    return LoginScreen();
  },
)

// Iniciar sesión
try {
  await authService.signInWithEmailAndPassword(email, password);
  // Éxito - navegar a home
} catch (e) {
  // Mostrar error: e.toString()
}