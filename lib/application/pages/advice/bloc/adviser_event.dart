part of 'adviser_bloc.dart';

@immutable
abstract class AdvicerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdviceRequestedEvent extends AdvicerEvent {}