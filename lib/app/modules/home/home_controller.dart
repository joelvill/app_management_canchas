import 'package:canchas_management/app/core/storage/cache_manager.dart';
import 'package:canchas_management/app/core/utils/canchas_list.dart';
import 'package:canchas_management/app/data/models/scheduling.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with CacheManager {
  List<SchedulingModel> schedulingList = [];

  HomeController();

  @override
  void onInit() {
    print('Init!');
    _init();

    super.onInit();
  }

  @override
  Future<void> onReady() async {
    print('Ready!');

    super.onReady();
  }

  _init() {
    if (getScheduling() != null) {
      schedulingList = schedulingListModelFromJson(getScheduling() ?? '');
    }
  }

  String canchaName(int id) {
    final cancha = canchasList.firstWhere((c) => c.id == id);
    return cancha.name;
  }

  removeSheduling(String id) {
    List<SchedulingModel> schedulingList =
        schedulingListModelFromJson(getScheduling() ?? '');
    schedulingList.removeWhere((s) => s.id == id);
    saveScheduling(schedulingListModelToJson(schedulingList));

    _init();
    update();
  }
}
