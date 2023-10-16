import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/screens/splash_screen/spalsh.dart';
class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=> WeatherCubit()..getAllWeatherData())

      ],
      child: const MaterialApp(
        home: SplashWeatherScreen(),
      ),
    );
  }
}
