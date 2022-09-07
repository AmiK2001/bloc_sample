import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_testing/domain/counter/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterBloc', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => CounterBloc(),
      expect: () => [],
    );

    blocTest(
      'emits [1] when CounterIncrementPressed is added',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(const CounterIncrementPressed()),
      expect: () => [
        const CounterState(value: 1),
      ],
    );
  });
}
