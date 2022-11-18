import 'package:canchas_management/app/data/provider/weather_api.dart';

class SchedulingFormRepository {
  final WeatherApi api;

  SchedulingFormRepository(this.api);

  Future<int> getPercentage(String date) async => api.getPercentage(date);
}
