import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text('Cubits'),
            subtitle: const Text('Gestor de estado simple'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title: Text('BLoC'),
            subtitle: const Text('Gestor de estado mas estructurado'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => context.push('/counter-bloc'),
          ),
        ],
      ),
    );
  }
}
