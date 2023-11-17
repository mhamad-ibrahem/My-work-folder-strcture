import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:new_structure/global/core/functions/show_api_error_toast.dart';
import '../../../local/core/api/api_links.dart';
import '../functions/check_internet_connection.dart';
import '../api/api_errors.dart';
import '../api/status_request.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

import '../class/app_toast.dart';

class HttpCrud {
  //http methods to use it get and add and delete and update data from Api
  Future<Either<ApiErrors, Map>> getRequest(
      {required String linkUrl, required bool isAuthorized}) async {
    try {
      if (await checkInternet()) {
        var response = await http
            .get(Uri.parse(linkUrl),
                headers:
                    isAuthorized ? ApiLinks.authorizedHeaders : ApiLinks.header)
            .timeout(const Duration(seconds: 30));
        Map responseBody = jsonDecode(response.body);
        log('=====================Status code :${response.statusCode}');
        log("=====================Response body :${jsonDecode(response.body)}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          // Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          showApiErrorToast(response.statusCode);
          return Left(ResponseError(
            statusCode: response.statusCode,
            message: responseBody['message'],
          ));
        }
      } else {
        AppToasts.errorToast("No internet connection");
        return Left(NetworkError(message: "No internet connection"));
      }
    } on TimeoutException catch (e) {
      // AppToasts.errorToast("Connection time out");
      log('TimeOut for the request $e');
      return left(TimeOutError(message: "TimeOut for the request"));
    } on SocketException catch (e) {
      AppToasts.errorToast("No internet connection");
      log('No internet connection | $e');
      return Left(NetworkError(message: "No internet connection"));
    } catch (e) {
      log("Catch error $e");
      AppToasts.errorToast("Catch error $e");
      return Left(ResponseError(
        message: "Catch error $e",
      ));
    }
  }

  Future<Either<StatusRequest, Map>> getData(
      {required String linkUrl, required bool isAuthorized}) async {
    try {
      if (await checkInternet()) {
        var response = await http
            .get(Uri.parse(linkUrl),
                headers:
                    isAuthorized ? ApiLinks.authorizedHeaders : ApiLinks.header)
            .timeout(const Duration(seconds: 30));
        log('=======================================');
        log('${response.statusCode}');
        log('=======================================');
        log(jsonDecode(response.body));
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          log('=======================================');
          log('$responseBody');
          log('=======================================');
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      log("Catch error $e");
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> postData(
      {required String linkUrl,
      required Map body,
      required bool isAuthorized}) async {
    try {
      if (await checkInternet()) {
        var response = await http
            .post(Uri.parse(linkUrl),
                body: body,
                headers:
                    isAuthorized ? ApiLinks.authorizedHeaders : ApiLinks.header)
            .timeout(const Duration(seconds: 30));
        log('=======================================');
        log('$response.statusCode');
        log('=======================================');
        log(jsonDecode(response.body));
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          log('=======================================');
          log('$responseBody');
          log('=======================================');
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      log("Catch error $e");
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> deleteData(
      {required String linkUrl, required bool isAuthorized}) async {
    try {
      if (await checkInternet()) {
        var response = await http
            .delete(Uri.parse(linkUrl),
                headers:
                    isAuthorized ? ApiLinks.authorizedHeaders : ApiLinks.header)
            .timeout(const Duration(seconds: 30));
        log('=======================================');
        log('$response.statusCode');
        log('=======================================');
        log(jsonDecode(response.body));
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          log('=======================================');
          log('$responseBody');
          log('=======================================');
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      log("Catch error $e");
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> multiPartRequest(
      {required String linkUrl,
      required Map<String, dynamic> data,
      File? file,
      required bool isAuthorized}) async {
    try {
      if (await checkInternet()) {
        var request = http.MultipartRequest('POST', Uri.parse(linkUrl));
        request.headers.addAll(
          isAuthorized ? ApiLinks.authorizedHeaders : ApiLinks.header,
        );
        var length = await file?.length();
        var stream = http.ByteStream(file!.openRead());
        if (length != 0) {
          var multiPartFile = http.MultipartFile('image', stream, length!,
              filename: basename(file.path));
          request.files.add(multiPartFile);
        }
        data.forEach((key, value) {
          request.fields[key] = value;
        });
        var myRequest = await request.send();
        var response = await http.Response.fromStream(myRequest);
        log('=======================================');
        log('$response.statusCode');
        log('=======================================');
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          log('=======================================');
          log('$responseBody');
          log('=======================================');
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      log('catch error  $_');
      return const Left(StatusRequest.serverException);
    }
  }
}
