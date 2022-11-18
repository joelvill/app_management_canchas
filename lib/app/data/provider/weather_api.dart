import 'package:dio/dio.dart';

import '../../core/utils/constants.dart';

class WeatherApi {
  final Dio _dio;
  WeatherApi(this._dio);

  Future<int> getPercentage(String date) async {
    final Response response = await _dio.get('/future.json', queryParameters: {
      "key": Constants.WAETHER_API_KEY,
      "q": "London",
      "dt": date
    });
    final res =
        response.data['forecast']['forecastday'][0]['day']['avghumidity'];

    return res;
  }
}
