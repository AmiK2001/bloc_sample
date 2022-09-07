import 'package:bloc/bloc.dart';
import 'package:bloc_testing/core/log/log.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_state.dart';
part 'counter_event.dart';

part 'counter_bloc.freezed.dart';

const _tag = "CounterBloc";

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterIncrementPressed>(
      (event, emit) => emit(
        state.copyWith(
          value: state.value + 1,
        ),
      ),
    );
  }

  @override
  void onChange(Change<CounterState> change) {
    super.onChange(change);
    Log.d(_tag, change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    Log.d(_tag, '$error, $stackTrace');
    super.onError(error, stackTrace);
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    Log.d(_tag, event);
  }

  @override
  void onTransition(Transition<CounterEvent, CounterState> transition) {
    super.onTransition(transition);
    Log.d(_tag, transition);
  }

  void increment() {
    add(const CounterEvent.counterIncrementPressed());
  }
}
