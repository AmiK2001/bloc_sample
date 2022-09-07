import 'package:bloc_testing/domain/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  static const counterButtonKey = Key("counterButton");

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final counterBloc = context.watch<CounterBloc>();

        return ElevatedButton(
          key: counterButtonKey,
          onPressed: () => counterBloc.increment(),
          child: Text('${counterBloc.state.value}'),
        );
      },
    );
  }
}
