import 'package:dartz/dartz.dart';
import 'package:flutter_mvvm/data/repositories/advice_repository_impl.dart';
import 'package:flutter_mvvm/domain/entities/advice_entity.dart';
import 'package:flutter_mvvm/domain/failures/failures.dart';

class AdviceUseCases {
  final adviceRepository = AdviceRepositoryImpl();

  Future<Either<AdviceEntity, Failure>> getAdvice() async {
    // call a repository to get data (failure or data)
    // proceed with business logic (manipulate the data)

    return adviceRepository.getAdviceFromDatasource();
    // execute business logic HERE

    // WILL THIS GO????
    /*
    await Future.delayed(const Duration(seconds: 2),(){});
    return left(
        const AdviceEntity(id: 1234, adviceString: 'Advice test')
    );
    */
    //return right(ServerFailure());
  }
}
