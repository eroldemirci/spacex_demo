import 'package:spacex_lastmission/service/last_mission_service.dart';

abstract class Repository {
  getMission();
}

class SampleRepository extends Repository {
  ServiceRepository _service = ServiceRepository();
  Future getMission() async {
    var response = await _service.getMission();
    return response;
  }
}
