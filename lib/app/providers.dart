import 'package:bloc_testing/domain/counter/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final providers = [
  BlocProvider<CounterBloc>(
    create: (context) => CounterBloc(),
  )
];
