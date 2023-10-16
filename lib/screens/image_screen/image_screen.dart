import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/components/my_text.dart';
import 'package:weather_app/core/size_config.dart';

class ImageWeatherScreen extends StatelessWidget {
  const ImageWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = WeatherCubit.get(context);
        return Scaffold(
          body: Container(
            margin: EdgeInsets.all(0),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage('assets/london.png'), fit: BoxFit.fill),
              gradient: const LinearGradient(
                begin: Alignment(0.21, 0.98),
                end: Alignment(-0.21, -0.98),
                colors: [Colors.white, Color(0xff5f5e96)],
              ),
            ),
            child:  SafeArea(
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(children: [
                      Icon(Icons.add, color: Colors.white, size: 40,),
                      Spacer(),
                      Icon(Icons.menu, color: Colors.white, size: 40,)
                    ],),
                  ),
                  Positioned(
                    left: SizeConfig.screenWidth!*0.3,
                      top: SizeConfig.screenHeight!*0.18,
                      child: Column(
                        children: [
                          MyText(color: Colors.white, size: 50, text:cubit.weatherModel!.name!,isBold: true,),
                          SizedBox(height: SizeConfig.screenHeight!*0.04,),
                          MyText(size: 55, color:Colors.white, isBold: true, text: cubit.weatherModel!.main!.temp.toString()),
                          SizedBox(height: SizeConfig.screenHeight!*0.01,),
                          MyText(size: 25, color:Colors.white, isBold: true,
                              text: cubit.weatherModel!.weather![cubit.index].description!),
                          SizedBox(height: SizeConfig.screenHeight!*0.01,),
                          Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xffab9e95).withOpacity(0.8),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                  blurStyle: BlurStyle.normal
                                ),
                              ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                const Icon(Icons.cloudy_snowing,size: 30,color: Colors.white),
                                const SizedBox(width: 3,),
                                MyText(size: 20, color: Colors.white, isBold: true, text: cubit.weatherModel!.clouds!.all.toString())
                              ]),
                            ),
                          )
                        ],
                      )
                  ),

                  Positioned(
                    bottom: 0,left: 0,right: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: SizeConfig.screenHeight!*0.21,
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0xffab9e95).withOpacity(0.8),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                  blurStyle: BlurStyle.normal
                              ),] ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10,left: 10,top: 15,bottom: 15),
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 MyText(size: 25, color: Colors.white, isBold: true, text:'☀️ Sunrise   '),
                                 MyText(size: 22, color: Colors.white, isBold: true, text:'${cubit.weatherModel!.sys!.sunrise}')
                               ]
                             ),
                             Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   MyText(size: 25, color: Colors.white, isBold: true, text:'🌤️  Sunset '),
                                   MyText(size: 22, color: Colors.white, isBold: true, text:'${cubit.weatherModel!.sys!.sunset}')
                                 ]
                             ),

                           ],

                          ),
                        ),
                      )
                      )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
