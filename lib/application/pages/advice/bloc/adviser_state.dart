part of 'adviser_bloc.dart';

@immutable
abstract class AdvicerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdviserInitial extends AdvicerState {}

class AdviserLoadingState extends AdvicerState {}

class AdviserOnAdviceState extends AdvicerState {
  final String advice;
  AdviserOnAdviceState({required this.advice});

  @override
  List<Object?> get props => [advice];
}

class AdviserErrorState extends AdvicerState {
  final String errorMessage;
  AdviserErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
