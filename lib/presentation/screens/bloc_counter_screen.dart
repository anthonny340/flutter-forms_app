import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Counter'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: Center(child: const Text('Counter Value: XX')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            heroTag: '1',
            child: const Text('+3'),
          ),
          FloatingActionButton(
            onPressed: () {},
            heroTag: '2',
            child: const Text('+2'),
          ),
          FloatingActionButton(
            onPressed: () {},
            heroTag: '3',
            child: const Text('+1'),
          ),
          // FloatingActionButton(onPressed: () {}, heroTag: '4'),
        ],
      ),
    );
  }
}
