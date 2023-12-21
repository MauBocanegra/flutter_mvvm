import 'package:dartz/dartz.dart';
import 'package:flutter_mvvm/domain/entities/advice_entity.dart';
import 'package:flutter_mvvm/domain/failures/failures.dart';

abstract class AdviceRepository {
  Future<Either<AdviceEntity, Failure>> getAdviceFromDatasource();
}