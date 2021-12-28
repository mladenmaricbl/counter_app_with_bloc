import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app_with_bloc/cubit/counter_cubit.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {
  group('CounterCubit', (){
    CounterCubit counterCubit = CounterCubit();

    // function will execute after every test run
    tearDown((){
      counterCubit.close();
    });

    test('Initial counter state', (){
      expect(counterCubit.state, CounterState(counterValue: 0, actionType: 'unpressed'));
    });

    test('Increment value', (){
      counterCubit.increment();
      expect(counterCubit.state, CounterState(counterValue: 1, actionType: 'increment'));
    });

    test('decrement value', (){
      counterCubit.decrement();
      expect(counterCubit.state, CounterState(counterValue: -1, actionType: 'decrement'));
    });

    // Test increment and decrement functions with bloc_test
    /*blocTest('the cubit shuld emit a CounterState(counterValue:1, actionType: increment) when increment() is called',
      build: () => counterCubit,
      act: (cubit) => cubit!.increment(),
      expect: [CounterState(counterValue: 1, actionType: 'increment')]
    );

    test('decrement value', (){
      counterCubit.decrement();
      expect(counterCubit.state, CounterState(counterValue: -1, actionType: 'decrement'));
    });*/

  });
}