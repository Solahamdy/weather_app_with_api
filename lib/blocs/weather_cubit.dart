import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/api_endpoints.dart';
import 'package:weather_app/service/dio_helper.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  static WeatherCubit get(context)=> BlocProvider.of(context);
  WeatherModel ? weatherModel  ;
   int index = 0;

  void getAllWeatherData(){
    emit(GetWeatherDataLoadingState());
 DioHelper.getData(url: GET_ALL_WEATHERS).then((value){
   var jsonData = jsonDecode(value.data);
   weatherModel = WeatherModel.fromJson(jsonData);
   emit(GetWeatherDataSuccessState());

  }).catchError((onError){
    debugPrint(onError.toString());
    emit(GetWeatherDataErrorState(onError.toString()));
 });

  }






}
