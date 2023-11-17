import '../../../Global/Core/Services/services.dart';

class ApiLinks {
  static Map<String, String> header = {
    "Accept": "application/json",
  };
  static Map<String, String> authorizedHeaders = {
    'Content-Type': 'application/json',
    'Authorization': "Bearer ${AppServices.token}",
  };

  static const apiKey = '6e696c69c23d471283bcd7ece41b4a67';
  static const serverLink = 'https://newsapi.org/v2/top-headlines';
}
