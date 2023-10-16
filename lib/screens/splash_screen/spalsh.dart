import 'package:flutter/material.dart';
import 'package:weather_app/components/my_text.dart';
import 'package:weather_app/core/size_config.dart';
import 'package:weather_app/screens/home_screen/weather_home_screen.dart';
class SplashWeatherScreen extends StatefulWidget {
  const SplashWeatherScreen({super.key});

  @override
  State<SplashWeatherScreen> createState() => _SplashWeatherScreenState();
}

class _SplashWeatherScreenState extends State<SplashWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body:Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment(0.21, 0.98),
            end: Alignment(-0.21, -0.98),
            colors: [Color(0xff5f5e96),Colors.white],
          ),
        ),
        child:  Stack(
          children: [
            Positioned(
                top :SizeConfig.screenHeight!*0.33,
                left: SizeConfig.screenWidth!*0.44,
                child:const Image(image: AssetImage('assets/Sun.png'),)
            ),
            Positioned(
              top :SizeConfig.screenHeight!*0.38,
                left: SizeConfig.screenWidth!*0.1,
                child:const Image(image: AssetImage('assets/Cloud.png'),)
            ),
            Positioned(
                top :SizeConfig.screenHeight!*0.63,
                left: SizeConfig.screenWidth!*0.35,
                child: MyText(color: Colors.black,
                  size: 35,isBold: true,text: 'Weather',
                )),
            Positioned(
                bottom :SizeConfig.screenHeight!*0.05,
                left: SizeConfig.screenWidth!*0.28,
                child: Container(
                  width: SizeConfig.screenWidth!*0.45,
                  height: SizeConfig.screenHeight!*0.05,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment(0.21, 0.98),
                      end: Alignment(-0.21, -0.98),
                      colors: [Color(0xff8c9fc6), Color(0xff92cbf5)],
                    ),
                  ),
                  child: MaterialButton(onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (BuildContext context)=>const WeatherHomeScreen()),
                            (route) => false);
                  },
                      child: Center(
                          child: MyText(color:Colors.white,text: 'Let`s start',
                            isBold: true,size: 25, ))),
                )),
          ],
        ),
      ),


    );
  }
}
