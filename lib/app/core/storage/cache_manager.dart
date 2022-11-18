import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveScheduling(String scheduling) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.SCHEDULING.toString(), scheduling);
    return true;
  }

  String? getScheduling() {
    final box = GetStorage();
    return box.read(CacheManagerKey.SCHEDULING.toString());
  }
}

enum CacheManagerKey {
  SCHEDULING,
}
