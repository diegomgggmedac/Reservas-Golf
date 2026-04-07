import 'package:flutter/material.dart';

class ChatDeServicio extends StatelessWidget {
  const ChatDeServicio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat de Servicio',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Chat de Servicio')),
        body: Center(
          child: FilledButton.tonal(
            onPressed: () {}, 
            child: const Text('Chat de Servicio'),
          ),
        ),
      ),
    );
  }
}
