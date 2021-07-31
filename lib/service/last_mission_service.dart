import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacex_lastmission/model/last_mission_model.dart';
import 'package:spacex_lastmission/utils/service_api_url.dart';

class ServiceRepository {
  final client = http.Client();
  Future<LastMissionModel?> getMission() async {
    http.Response response = await client.get(Uri.parse(LATEST_MISSION_URL));

    if (response.statusCode == 200) {
      LastMissionModel result =
          LastMissionModel.fromJson(jsonDecode(response.body));
      return result;
    } else {
      return null;
    }
  }
}
