import 'package:dartz/dartz.dart';
import '../../../../global/core/api/api_errors.dart';
import '../../../../global/core/api/http_crud.dart';
import '../../../core/api/api_links.dart';


class TestData {
  HttpCrud crud;
  TestData(this.crud);

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getNewsData(
      {required String query}) async {
    return await crud.getRequest(
      linkUrl: '${ApiLinks.serverLink}?$query&apiKey=${ApiLinks.apiKey}',
      isAuthorized: false,
    );
  }
}
