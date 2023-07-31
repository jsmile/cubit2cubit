import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/cubits/color/color_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int increasedNumber = 1;
  final ColorCubit colorCubit;
  late final StreamSubscription<ColorState> colorSubscription;

  CounterCubit({required this.colorCubit}) : super(CounterState.initial()) {
    colorSubscription = colorCubit.stream.listen(
      (ColorState colorState) {},
    ); // State 구독신청을 하고, 후에 StreamSubscription 을 취소시키기 위함.
  }

  @override
  Future<void> close() {
    colorSubscription.cancel(); // 구독( colorSubscription )을 취소한 뒤에 close()
    return super.close();
  }
}
