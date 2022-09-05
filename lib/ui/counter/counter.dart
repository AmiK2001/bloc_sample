import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverbloc_testing/app/providers.dart';
import 'package:riverbloc_testing/domain/counter/counter_bloc.dart';

class Counter extends HookConsumerWidget {
  static const counterButtonKey = Key("counterButton");

  const Counter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterBloc = ref.read(counterBlocProvider);

    return BlocBuilder<CounterBloc, CounterState>(
      bloc: counterBloc,
      builder: (context, state) {
        return ElevatedButton(
          key: counterButtonKey,
          onPressed: () => counterBloc.increment(),
          child: Text('${state.value}'),
        );
      },
    );
  }
}
