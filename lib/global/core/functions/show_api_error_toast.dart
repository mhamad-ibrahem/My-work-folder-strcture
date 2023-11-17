import 'dart:developer';

import 'package:new_structure/global/core/class/app_toast.dart';

showApiErrorToast(int statusCode) {
  if (statusCode == 204) {
    log("======================== Error: No Content: The request was successful, but there is no data to return");
    // AppToasts.successToast("No Data to show");
  } else if (statusCode == 400) {
    log("======================== Error: Bad Request: The request was malformed or invalid.");
    // AppToasts.errorToast("Make sure to fill required form");
  } else if (statusCode == 404) {
    log(" ======================== Error: Not Found: The requested resource could not be found.check the url api link");
    // AppToasts.errorToast("Url link error");
  } else if (statusCode == 401) {
    log("======================== Error: Unauthorized: The request requires authentication, but the user has not provided valid credentials  the token key is required in header");
    AppToasts.errorToast("Unauthorized please login");
  } else if (statusCode == 402) {
    log("Error : payment required");
    // AppToasts.errorToast("Payment Required");
  } else if (statusCode == 403) {
    log("======================== Error: Forbidden use vpn");
    // AppToasts.errorToast("Forbidden try using vpn");
  } else if (statusCode == 305) {
    log("======================== Error: Forbidden use vpn");
    // AppToasts.errorToast(
    // "Indicates that a requested response must be accessed by a proxy");
  } else if (statusCode == 500) {
    log("======================== Error: Server error ");
    // AppToasts.errorToast(
    //     "Internal Server Error: The server encountered an error while processing the request");
  }
}
