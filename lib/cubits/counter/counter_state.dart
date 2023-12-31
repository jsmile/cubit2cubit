// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;

  CounterState({required this.counter});
  factory CounterState.initial() => CounterState(counter: 0);

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  List<Object> get props => [counter];

  @override
  bool get stringify => true;
}
