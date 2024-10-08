import 'package:weathero/core/common/common.dart';
import 'package:weathero/features/hourly_forecast/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/hourly_forecast_cubit.dart';

class HourlyForecastScreen extends StatelessWidget {
  const HourlyForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HourlyForecastCubit, DetailedForecastState>(
      builder: (context, state) {
        if (state is DetailedForecastInitial) {
          return const LoadingWidget();
        } else if (state is DetailsForecastSuccess) {
          return HourlyForecastWidget(
            hourlyForecast: state.hourlyForecast,
            dailyForecast: state.dailyForecast,
            article: state.article,
          );
        } else if (state is DetailedForecastError) {
          return FailureWidget(text: state.errorMessage);
        } else {
          return const FailureWidget();
        }
      },
    );
  }
}
