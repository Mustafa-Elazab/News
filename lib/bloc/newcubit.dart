import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/local/sharedpreferenceHelper.dart';

import 'newstate.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntinalState());

  static AppCubit get(context) => BlocProvider.of(context);

  var isDark=false;
  void changeAppMode(){
    isDark=!isDark;
    CacheHelper.putData(key: 'isDark', value: isDark).then((value){
      emit(ModeAppChangeState());
    });
    print(isDark);
  }
}