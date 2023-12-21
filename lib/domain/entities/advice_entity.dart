import 'package:equatable/equatable.dart';

class AdviceEntity extends Equatable {
  final String adviceString;
  final int id;

  const AdviceEntity({
    required this.id,
    required this.adviceString
  });

  @override
  List<Object> get props => [adviceString, id];

}