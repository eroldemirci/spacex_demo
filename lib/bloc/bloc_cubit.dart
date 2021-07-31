import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_lastmission/bloc/bloc_state.dart';
import 'package:spacex_lastmission/model/last_mission_model.dart';
import 'package:spacex_lastmission/repository/repository.dart';

class LatestMissionCubit extends Cubit<LatestMissionState> {
  LatestMissionCubit(this.repository) : super(LatestMissionInitialState());
  final Repository repository;

  Future<LastMissionModel?> getMission() async {
    try {
      emit(LatestMissionLoadingState());
      LastMissionModel response = await repository.getMission();
      emit(LatestMissionLoadedState(response));
    } on Exception catch (error) {
      emit(LatestMissionErrorState(
          'Beklenmedik bir hata oluştu : ' + error.toString()));
    }
  }
}
