import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvvm/domain/entities/advice_entity.dart';
import 'package:flutter_mvvm/domain/failures/failures.dart';
import 'package:flutter_mvvm/domain/usecases/advice_usecases.dart';

part 'adviser_event.dart';
part 'adviser_state.dart';

const serverFailureMessage = 'Server Failure';
const cacheFailureMessage = 'Server Failure';
const generalFailureMessage = 'Server Failure';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdviserInitial()) {
    final AdviceUseCases adviceUseCases = AdviceUseCases();
    // could also use other use case

    String mapFailureToMessage(Failure failure){
      switch (failure.runtimeType) {
        case ServerFailure: return serverFailureMessage;
        case CacheFailure: return cacheFailureMessage;
        default: return generalFailureMessage;
      }
    }

    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviserLoadingState());
      final adviceOrFailure = await adviceUseCases.getAdvice();
      adviceOrFailure.fold(
              (advice) => emit(AdviserOnAdviceState(advice: advice.adviceString)),
              (failure) => emit(AdviserErrorState(
                  errorMessage: mapFailureToMessage(failure)
              ))
      );
    });
  }
}
