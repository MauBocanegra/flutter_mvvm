import 'dart:html';

import 'package:flutter_mvvm/domain/failures/failures.dart';
import 'package:http/http.dart' as http;
///
abstract class AdviceRemoteDatasource {
  /// Requests advices from API
  /// returns [AdviceModel] if successfull
  /// else [ServerFailure] if code != 200
  Future<AdviceModel> getAdviceFromApi();
}

class AdviceRemoteDataSourceImpl implements AdviceRemoteDatasource{
  final http.Client client = http.Client();
  
  @override
  Future<AdviceModel> getAdviceFromApi() async {
    final response = await client.get(
        Uri.parse('https://api.flutter-community.com/api/v1/advice'),
        headers: {
          'content-type': 'application/json',
        }
    );
    // TODO: implement getAdviceFromApi
    throw UnimplementedError();
  }
}