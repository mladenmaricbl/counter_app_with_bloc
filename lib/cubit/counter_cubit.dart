import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0, actionType: 'unpressed'));
  
  void increment() => emit(CounterState(counterValue: state.counterValue + 1, actionType: 'increment'));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1, actionType: 'decrement'));
}
