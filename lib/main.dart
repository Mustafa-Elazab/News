
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/newstate.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/network/local/sharedpreferenceHelper.dart';
import 'bloc/myblocobserver.dart';
import 'bloc/newcubit.dart';
import 'layout/newshome.dart';
import 'network/remote/dio.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isDark=false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getbusinessData()..getsportsData()..getscienceData()),
        BlocProvider(  create: (BuildContext context)=>AppCubit(),)
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener:(BuildContext context,state){},
        builder:(context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white, statusBarBrightness: Brightness.dark),
                color: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.redAccent,
                  elevation: 30.0
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600
                ),
              ),
              primarySwatch: Colors.red,
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'), statusBarBrightness: Brightness.light),
                color:HexColor('333739'),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.redAccent,
                  unselectedItemColor: Colors.grey,
                  elevation: 30.0
                  ,
                  backgroundColor: HexColor('333739')
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              primarySwatch: Colors.red,
            ),
            themeMode:AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home: newsHome(

            ),
          );
        },
      ),
    );
  }
}
