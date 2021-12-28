part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterValue;
  final String actionType;

  CounterState({
    required this.counterValue,
    required this.actionType,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [this.counterValue, this.actionType];
}
