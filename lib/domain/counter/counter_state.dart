part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int value;

  const CounterState({
    this.value = 0,
  });

  CounterState copyWith({
    int? value,
  }) {
    return CounterState(
      value: value ?? this.value,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [value];

  static CounterState get initial => const CounterState();
}
