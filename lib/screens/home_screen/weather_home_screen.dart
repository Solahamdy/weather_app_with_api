import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/screens/home_screen/components/custom_weather_container.dart';
import 'package:weather_app/screens/image_screen/image_screen.dart';

import '../../components/my_text.dart';
import '../../core/size_config.dart';

class WeatherHomeScreen extends StatelessWidget {
  const WeatherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = WeatherCubit.get(context);
        if(state is GetWeatherDataLoadingState){
          return const Center(child: CircularProgressIndicator());

        }else if (state is GetWeatherDataSuccessState) {


        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment(0.21, 0.98),
                  end: Alignment(-0.21, -0.98),
                  colors: [Colors.white, Color(0xff5f5e96)],
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          begin: Alignment(0.21, 0.98),
                          end: Alignment(-0.21, -0.98),
                          colors: [ Color(0xff9a99c1),Color(0xff807fae)],
                        ),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Enter Location',
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 20),
                            prefixIcon:
                                Icon(Icons.search, color: Colors.white)),
                      ),
                    ),
                  InkWell(
                    onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>const ImageWeatherScreen()),
                          (route) => false);},
                     child: CustomWeatherContainer(
                         city: cubit.weatherModel!.name!,
                         temp: cubit.weatherModel!.main!.temp.toString(),
                         coord: 'lon : ${cubit.weatherModel!.coord!.lon!.toString()}  lat : ${cubit.weatherModel!.coord!.lat.toString()}',
                          wind: 'speed : ${cubit.weatherModel!.wind!.speed.toString()}   deg : ${cubit.weatherModel!.wind!.deg.toString()}' ,
                         timeZone: cubit.weatherModel!.timezone!,
                     ),
                   ),

                    const Spacer(),
                    Container(
                      height: SizeConfig.screenHeight! * 0.35,
                      width: SizeConfig.screenWidth,
                      decoration: const BoxDecoration(
                          color: Color(0xffced3ff),
                          shape: BoxShape.rectangle,
                          gradient: LinearGradient(
                            begin: Alignment(0.30, 0.98),
                            end: Alignment(-0.21, -0.98),
                            colors: [Colors.white, Color(0xff9998c3)],
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(160),
                              topRight: Radius.circular(160))),
                      child: Stack(
                        children: [
                          Positioned(
                              top: SizeConfig.screenHeight! * 0.05,
                              left: SizeConfig.screenWidth! * 0.48,
                              child: const Image(
                                image: AssetImage('assets/Sun.png'),
                                height: 115,
                                width: 115,
                              )),
                          Positioned(
                              top: SizeConfig.screenHeight! * 0.03,
                              left: SizeConfig.screenWidth! * 0.21,
                              child: const Image(
                                  image: AssetImage('assets/Cloud.png'),
                                  height: 203,
                                  width: 203)),
                          Positioned(
                              top: SizeConfig.screenHeight! * 0.25,
                              left: SizeConfig.screenWidth! * 0.33,
                              child: MyText(
                                color: Colors.black,
                                size: 35,
                                isBold: true,
                                text: 'Weather',
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
        }
        else if (state is GetWeatherDataErrorState){
          return Center(child: Text(state.error));
        }
        else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
