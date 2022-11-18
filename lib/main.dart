import 'package:canchas_management/app/modules/home/home_binding.dart';
import 'package:canchas_management/app/modules/home/home_page.dart';
import 'package:canchas_management/app/routes/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Canchas Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      initialBinding: HomeBindings(),
      getPages: AppPages.pages,
    );
  }
}
