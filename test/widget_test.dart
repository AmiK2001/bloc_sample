import 'package:bloc_testing/app/app.dart';
import 'package:bloc_testing/domain/counter/counter_bloc.dart';
import 'package:bloc_testing/ui/counter/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('update the UI when incrementing the state', (tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(),
          ),
        ],
        child: const App(),
      ),
    );

    // The default value is `0`, as declared in our provider
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Increment the state and re-render
    await tester.tap(find.byKey(Counter.counterButtonKey));
    await tester.pump();

    // The state have properly incremented
    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });

  testWidgets('the counter state is not shared between tests', (tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(),
          ),
        ],
        child: const App(),
      ),
    );

    // The state is `0` once again, with no tearDown/setUp needed
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}
