import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../data/provider/weather_api.dart';
import 'scheduling_form_repository.dart';
import 'sheduling_form_controller.dart';

class ShedulingFormBinding implements Bindings {
  @override
  void dependencies() {
    final dio = Dio(
      BaseOptions(baseUrl: "http://api.weatherapi.com/v1"),
    );
    final api = WeatherApi(dio);
    final repository = SchedulingFormRepository(api);
    Get.lazyPut(() => SchedulingFormController(repository));
  }
}
