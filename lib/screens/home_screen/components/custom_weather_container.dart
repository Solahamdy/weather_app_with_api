import 'package:flutter/material.dart';
import 'package:weather_app/components/my_text.dart';
import 'package:weather_app/core/size_config.dart';
class CustomWeatherContainer extends StatelessWidget {
 final String city ;
 final String temp ;
 final String coord ;
 final String wind ;
 final int timeZone;
  CustomWeatherContainer({required this.timeZone,required this.wind,required this.city,required this.temp,required this.coord,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight!*0.35,
      width: SizeConfig.screenWidth!*0.9,
      margin: const EdgeInsets.symmetric( horizontal: 10),
      padding: const EdgeInsets.all(15),
      decoration:  BoxDecoration(
        color: const Color(0xff8c9fc6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              MyText(size: 40, color:Colors.white, isBold: true, text: city),
              SizedBox( height: SizeConfig.screenHeight!*0.02,),
              MyText(size:26, color:const Color(0xff5f5e96), isBold: true, text: 'Coord'),
              const SizedBox(height: 5,),
              MyText(size:20, color: Colors.white, isBold: true, text: coord),
              const SizedBox(height: 10,),
              MyText(size: 26, color: const Color(0xff5f5e96), isBold: true, text: 'Wind'),
              const SizedBox(height: 5,),
              MyText(size: 20, color: Colors.white, isBold: true, text: wind),
              const SizedBox(height: 10,),
              MyText(size: 26, color: const Color(0xff5f5e96), isBold: true, text: 'Time Zone'),
              const SizedBox(height: 5,),
              MyText(size: 20, color: Colors.white, isBold: true, text: '${timeZone.toInt()}')
            ],
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(size: 60, color:Colors.white, isBold: true, text: temp),

            ],
          )

        ],
      ),
    );
  }
}