// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'color_cubit.dart';

class ColorState extends Equatable {
  final Color color;

  const ColorState({this.color = Colors.red});
  factory ColorState.initial() => ColorState();

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }

  @override
  List<Object> get props => [color];

  @override
  bool get stringify => true;
}
