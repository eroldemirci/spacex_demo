import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_lastmission/bloc/bloc_cubit.dart';
import 'package:spacex_lastmission/bloc/bloc_state.dart';
import 'package:spacex_lastmission/model/last_mission_model.dart';
import 'package:spacex_lastmission/repository/repository.dart';
import 'package:spacex_lastmission/utils/text_styles.dart';
import 'package:spacex_lastmission/widgets/home_screen_widgets.dart/custom_card.dart';
import 'package:spacex_lastmission/widgets/home_screen_widgets.dart/title_widget.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LatestMissionCubit(SampleRepository()),
      child: BlocConsumer<LatestMissionCubit, LatestMissionState>(
        listener: (context, state) {},
        builder: (context, state) {
          final LatestMissionCubit _bloc =
              BlocProvider.of<LatestMissionCubit>(context);
          return AnnotatedRegion(
            value: SystemUiOverlayStyle.light,
            child: Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(child: mainBody(state, _bloc)),
            ),
          );
        },
      ),
    );
  }

  Widget mainBody(LatestMissionState state, LatestMissionCubit bloc) {
    if (state is LatestMissionInitialState) {
      bloc.getMission();
      return Center(
        child: Text(
          'Hoşgeldiniz',
          style: bodyTextStyle,
        ),
      );
    } else if (state is LatestMissionLoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is LatestMissionErrorState) {
      return Center(
        child: Text(
          state.message,
          style: bodyTextStyle,
        ),
      );
    } else if (state is LatestMissionLoadedState) {
      LastMissionModel data = state.response;
      return SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CustomTitleWidget(
                imageUrl: data.links!.patch!.large,
              ),
              SizedBox(
                height: 20,
              ),
              CustomCardWidget(
                flickr: data.links!.flickr!,
                name: data.name,
                detail: data.details,
                date: data.dateUtc,
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}
