import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_structure/global/core/functions/show_api_error_toast.dart';
import '../../../local/core/api/api_links.dart';
import '../functions/check_internet_connection.dart';
import '../api/api_errors.dart';
import 'dart:io';

final dio = Dio();

class DioCrud {
  Future<Either<ApiErrors, Map>> post({
    required String linkUrl,
    required Map data,
    required bool isAuthorized,
  }) async {
    try {
      if (await checkInternet()) {
        final response = await dio.post(linkUrl,
            data: data,
            options: Options(
                receiveTimeout: const Duration(seconds: 10),
                sendTimeout: const Duration(seconds: 10),
                headers: isAuthorized
                    ? ApiLinks.authorizedHeaders
                    : ApiLinks.header));
        Map responseBody = jsonDecode(response.data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(responseBody);
        } else {
          // showApiErrorToast(response.statusCode!);
          return Left(ResponseError(
            statusCode: response.statusCode,
            message: responseBody['message'],
          ));
        }
      } else {
        // AppToasts.errorToast("No internet connection");
        return Left(NetworkError(message: "No internet connection"));
      }
    } on TimeoutException catch (e) {
      log('TimeOut for the request $e');
      return left(TimeOutError(message: "TimeOut for the request"));
    } on SocketException catch (e) {
      // AppToasts.errorToast("No internet connection");
      log('No internet connection | $e');
      return Left(NetworkError(message: "No internet connection"));
    } on DioException catch (e) {
      log("Catch error $e");
      // AppToasts.errorToast("Catch error $e");
      return Left(ResponseError(
        message: "Catch error $e",
      ));
    }
  }

  Future<Either<ApiErrors, Map>> get({
    required String linkUrl,
    required bool isAuthorized,
  }) async {
    try {
      if (await checkInternet()) {
        final response = await dio.get(linkUrl,
            options: Options(
                receiveTimeout: const Duration(seconds: 10),
                sendTimeout: const Duration(seconds: 10),
                headers: isAuthorized
                    ? ApiLinks.authorizedHeaders
                    : ApiLinks.header));
        Map responseBody = jsonDecode(response.data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(responseBody);
        } else {
          // showApiErrorToast(response.statusCode!);
          return Left(ResponseError(
            statusCode: response.statusCode,
            message: responseBody['message'],
          ));
        }
      } else {
        // AppToasts.errorToast("No internet connection");
        return Left(NetworkError(message: "No internet connection"));
      }
    } on TimeoutException catch (e) {
      log('TimeOut for the request $e');
      return left(TimeOutError(message: "TimeOut for the request"));
    } on SocketException catch (e) {
      // AppToasts.errorToast("No internet connection");
      log('No internet connection | $e');
      return Left(NetworkError(message: "No internet connection"));
    } on DioException catch (e) {
      log("Catch error $e");
      // AppToasts.errorToast("Catch error $e");
      return Left(ResponseError(
        message: "Catch error $e",
      ));
    }
  }

  Future<Either<ApiErrors, Map>> delete({
    required String linkUrl,
    required Map data,
    required bool isAuthorized,
  }) async {
    try {
      if (await checkInternet()) {
        final response = await dio.delete(linkUrl,
            data: data,
            options: Options(
                receiveTimeout: const Duration(seconds: 10),
                sendTimeout: const Duration(seconds: 10),
                headers: isAuthorized
                    ? ApiLinks.authorizedHeaders
                    : ApiLinks.header));
        Map responseBody = jsonDecode(response.data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(responseBody);
        } else {
          // showApiErrorToast(response.statusCode!);
          return Left(ResponseError(
            statusCode: response.statusCode,
            message: responseBody['message'],
          ));
        }
      } else {
        // AppToasts.errorToast("No internet connection");
        return Left(NetworkError(message: "No internet connection"));
      }
    } on TimeoutException catch (e) {
      log('TimeOut for the request $e');
      return left(TimeOutError(message: "TimeOut for the request"));
    } on SocketException catch (e) {
      // AppToasts.errorToast("No internet connection");
      log('No internet connection | $e');
      return Left(NetworkError(message: "No internet connection"));
    } on DioException catch (e) {
      log("Catch error $e");
      // AppToasts.errorToast("Catch error $e");
      return Left(ResponseError(
        message: "Catch error $e",
      ));
    }
  }

  Future<Either<ApiErrors, Map>> patch({
    required String linkUrl,
    required Map data,
    required bool isAuthorized,
  }) async {
    try {
      if (await checkInternet()) {
        final response = await dio.patch(linkUrl,
            data: data,
            options: Options(
                receiveTimeout: const Duration(seconds: 10),
                sendTimeout: const Duration(seconds: 10),
                headers: isAuthorized
                    ? ApiLinks.authorizedHeaders
                    : ApiLinks.header));
        Map responseBody = jsonDecode(response.data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(responseBody);
        } else {
          // showApiErrorToast(response.statusCode!);
          return Left(ResponseError(
            statusCode: response.statusCode,
            message: responseBody['message'],
          ));
        }
      } else {
        // AppToasts.errorToast("No internet connection");
        return Left(NetworkError(message: "No internet connection"));
      }
    } on TimeoutException catch (e) {
      log('TimeOut for the request $e');
      return left(TimeOutError(message: "TimeOut for the request"));
    } on SocketException catch (e) {
      // AppToasts.errorToast("No internet connection");
      log('No internet connection | $e');
      return Left(NetworkError(message: "No internet connection"));
    } on DioException catch (e) {
      log("Catch error $e");
      // AppToasts.errorToast("Catch error $e");
      return Left(ResponseError(
        message: "Catch error $e",
      ));
    }
  }

  Future<Either<ApiErrors, Map>> multiPart({
    required String linkUrl,
    required Map data,
    required bool isAuthorized,
    required List<File> files,
  }) async {
    try {
      if (await checkInternet()) {
        final formData = FormData.fromMap({
          // 'name': 'dio',
          // 'date': DateTime.now().toIso8601String(),
          // 'file': await MultipartFile.fromFile('./text.txt',
          //     filename: 'upload.txt'),
          'files': [
            files.forEach((element) async {
              await MultipartFile.fromFile('./text1.txt',
                  filename: element.path);
            }),
            // await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
          ]
        });
        final response = await dio.post(linkUrl,
            data: {
              data,
              formData,
            },
            options: Options(
                receiveTimeout: const Duration(seconds: 10),
                sendTimeout: const Duration(seconds: 10),
                headers: isAuthorized
                    ? ApiLinks.authorizedHeaders
                    : ApiLinks.header));
        Map responseBody = jsonDecode(response.data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(responseBody);
        } else {
          showApiErrorToast(response.statusCode!);
          return Left(ResponseError(
            statusCode: response.statusCode,
            message: responseBody['message'],
          ));
        }
      } else {
        // AppToasts.errorToast("No internet connection");
        return Left(NetworkError(message: "No internet connection"));
      }
    } on TimeoutException catch (e) {
      log('TimeOut for the request $e');
      return left(TimeOutError(message: "TimeOut for the request"));
    } on SocketException catch (e) {
      // AppToasts.errorToast("No internet connection");
      log('No internet connection | $e');
      return Left(NetworkError(message: "No internet connection"));
    } on DioException catch (e) {
      log("Catch error $e");
      // AppToasts.errorToast("Catch error $e");
      return Left(ResponseError(
        message: "Catch error $e",
      ));
    }
  }
}
