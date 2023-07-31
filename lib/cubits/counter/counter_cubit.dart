import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '/cubits/color/color_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int increasedNumber = 1;
  final ColorCubit colorCubit;
  late final StreamSubscription<ColorState> colorSubscription;

  // 참조하는 cubit 에서 참조할 state의 cubit 을 생성자의 param 으로 받아와서 서로 연결시킴.
  CounterCubit({required this.colorCubit}) : super(CounterState.initial()) {
    colorSubscription = colorCubit.stream.listen(
      (ColorState colorState) {
        if (colorState.color == Colors.red) {
          increasedNumber = 1;
        } else if (colorState.color == Colors.green) {
          increasedNumber = 10;
        } else if (colorState.color == Colors.blue) {
          increasedNumber = 100;
        } else if (colorState.color == Colors.black) {
          increasedNumber = -100;
        }
      },
    ); // State 구독신청을 하고, 후에 StreamSubscription 을 취소시키기 위함.
  }

  @override
  Future<void> close() {
    colorSubscription.cancel(); // 구독( colorSubscription )을 취소한 뒤에 close()
    return super.close();
  }

  void changeCounter() {
    emit(state.copyWith(counter: state.counter + increasedNumber));
  }
}
