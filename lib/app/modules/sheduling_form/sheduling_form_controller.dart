import 'package:canchas_management/app/core/storage/cache_manager.dart';
import 'package:canchas_management/app/data/models/scheduling.dart';
import 'package:canchas_management/app/modules/sheduling_form/scheduling_form_repository.dart';
import 'package:canchas_management/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class SchedulingFormController extends GetxController with CacheManager {
  final SchedulingFormRepository _repository;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController dateInput = TextEditingController();
  TextEditingController userInput = TextEditingController();

  late String selectCancha = '1';
  final uuid = const Uuid();

  SchedulingFormController(this._repository);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    super.dispose();
  }

  String? validatorUser(String value) {
    if (value.isEmpty) {
      return 'El usuario es requerido';
    }

    if (value.length < 3) {
      return 'Minimo 3 caracteres';
    }

    return null;
  }

  onChangeCancha(String v) {
    selectCancha = v;
    update();
  }

  Future<void> onSubmit() async {
    if (formKey.currentState!.validate()) {
      try {
        final data = {
          "id": uuid.v1(),
          "date": dateInput.text,
          "user": userInput.text,
          "cancha_id": int.parse(selectCancha),
        };
        final SchedulingModel scheduling = SchedulingModel.fromJson(data);

        List<SchedulingModel> schedulingList = [];
        String? listSchedulingString = getScheduling();

        if (listSchedulingString == null) {
          schedulingList.add(scheduling);
        } else {
          schedulingList = schedulingListModelFromJson(getScheduling() ?? '');
          schedulingList.add(scheduling);
        }

        saveScheduling(schedulingListModelToJson(schedulingList));

        final res = await _repository.getPercentage(dateInput.text);
      } catch (e) {
        Get.snackbar(
          'Error!',
          'No se pudo obtener el pronostico!',
          backgroundColor: Colors.redAccent.withOpacity(0.75),
          colorText: Colors.white,
        );
        print(e);
      }

      Get.offAllNamed(
        AppRoutes.HOME,
      );
    }
  }

  onChanceDate(String v) {
    dateInput.text = v;
    update();
  }
}
