import 'package:dartz/dartz.dart';
import 'package:flutter_mvvm/domain/entities/advice_entity.dart';
import 'package:flutter_mvvm/domain/failures/failures.dart';
import 'package:flutter_mvvm/domain/repositories/advice_repository.dart';

class AdviceRepositoryImpl implements AdviceRepository {
  @override
  Future<Either<AdviceEntity, Failure>> getAdviceFromDatasource() {
    // TODO: implement getAdviceFromDatasource
    throw UnimplementedError();
  }

}