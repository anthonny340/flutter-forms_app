import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext _) => CounterBloc(),
      child: BlocCouterView(),
    );
  }
}

class BlocCouterView extends StatelessWidget {
  const BlocCouterView({super.key});

  void increseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>()
    // .add(CounterIncreased(value));
    .increaseBy(value);
  }

  void resetCounter(BuildContext context) {
    context
        .read<CounterBloc>()
        // .add(CounterReset());
        .resetCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc counterBloc) =>
              Text('BLoC Counter: ${counterBloc.state.transactionCount}'),
        ),
        actions: [
          IconButton(
            onPressed: () => resetCounter(context),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc counterBloc) =>
              Text('Counter Value: ${counterBloc.state.counter}'),
        ),
      ),
      floatingActionButton: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => increseCounterBy(context, 3),
            heroTag: '1',
            child: const Text('+3'),
          ),
          FloatingActionButton(
            onPressed: () => increseCounterBy(context, 2),
            heroTag: '2',
            child: const Text('+2'),
          ),
          FloatingActionButton(
            onPressed: () => increseCounterBy(context),
            heroTag: '3',
            child: const Text('+1'),
          ),
          // FloatingActionButton(onPressed: () {}, heroTag: '4'),
        ],
      ),
    );
  }
}
