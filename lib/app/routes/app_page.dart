import 'package:canchas_management/app/modules/home/home_binding.dart';
import 'package:canchas_management/app/modules/home/home_page.dart';
import 'package:canchas_management/app/modules/sheduling_form/sheduling_form_page.dart';
import 'package:get/get.dart';

import '../modules/sheduling_form/sheduling_form_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.SCHEDULINGFORM,
      page: () => const SchedulingFormPage(),
      binding: ShedulingFormBinding(),
    ),
  ];
}
