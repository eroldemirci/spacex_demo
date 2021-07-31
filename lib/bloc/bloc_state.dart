import 'package:spacex_lastmission/model/last_mission_model.dart';

abstract class LatestMissionState {
  const LatestMissionState();
}

class LatestMissionInitialState extends LatestMissionState {
  const LatestMissionInitialState();
}

class LatestMissionLoadingState extends LatestMissionState {
  const LatestMissionLoadingState();
}

class LatestMissionLoadedState extends LatestMissionState {
  const LatestMissionLoadedState(this.response);
  final LastMissionModel response;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LatestMissionLoadedState && o.response == response;
  }

  @override
  int get hashCode => response.hashCode;
}

class LatestMissionErrorState extends LatestMissionState {
  const LatestMissionErrorState(this.message);
  final String message;
}
