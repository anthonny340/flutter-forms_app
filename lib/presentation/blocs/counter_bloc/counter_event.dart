part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int increseBy;

  const CounterIncreased(this.increseBy);
}

class CounterReset extends CounterEvent {
  const CounterReset();
}
