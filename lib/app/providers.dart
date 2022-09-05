import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverbloc_testing/domain/counter/counter_bloc.dart';

final counterBlocProvider = Provider(
  (ref) => CounterBloc(),
);
