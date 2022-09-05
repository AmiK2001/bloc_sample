import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:riverbloc_testing/core/log/log.dart';

part 'counter_event.dart';
part 'counter_state.dart';

const _tag = "CounterBloc";

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial) {
    on<CounterIncrementPressed>(
      (event, emit) => emit(
        state.copyWith(
          value: state.value + 1,
        ),
      ),
    );
  }

  void increment() {
    add(CounterIncrementPressed());
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    Log.d(_tag, event);
  }

  @override
  void onChange(Change<CounterState> change) {
    super.onChange(change);
    Log.d(_tag, change);
  }

  @override
  void onTransition(Transition<CounterEvent, CounterState> transition) {
    super.onTransition(transition);
    Log.d(_tag, transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    Log.d(_tag, '$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
