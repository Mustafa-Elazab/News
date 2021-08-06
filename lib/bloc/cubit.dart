import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/modeuls/business/businessScreen.dart';
import 'package:news_app/modeuls/science/scienceScreen.dart';
import 'package:news_app/modeuls/sport/sportScreen.dart';
import 'package:news_app/network/remote/dio.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(IntinalState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int current_index = 0;
  List<Widget> screens = [
    businessScreen(),
    sportScreen(),
    scienceScreen(),
  ];

  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];

  void changebottomnavbar(int index) {
    current_index = index;
    emit(ChangeBottomNavBarState());
  }

  List<dynamic> businessData = [];

  void getbusinessData() {
    emit(BusinessgetDataLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', Query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'c8c606a8d9a94bb0bd9fa6faee2d8568'
    }).then((value) {
      businessData = value.data['articles'];
      print(businessData.length);
      print(businessData[0]["title"]);
      emit(BusinessgetDataSecufulState());
    }).catchError((error) {
      print(error);
      emit(BusinessgetDataErrorState(error));
    });
  }

  List<dynamic> sportsData = [];

  void getsportsData() {
    emit(SportsgetDataLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', Query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'c8c606a8d9a94bb0bd9fa6faee2d8568'
    }).then((value) {
      sportsData = value.data['articles'];
      print(sportsData.length);
      print(sportsData[0]["title"]);
      emit(SportsgetDataSecufulState());
    }).catchError((error) {
      print(error);
      emit(SportsgetDataErrorState(error));
    });
  }

  List<dynamic> scienceData = [];

  void getscienceData() {
    emit(SciencegetDataLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', Query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'c8c606a8d9a94bb0bd9fa6faee2d8568'
    }).then((value) {
      scienceData = value.data['articles'];
      print(scienceData.length);
      print(scienceData[0]["title"]);
      emit(SciencegetDataSecufulState());
    }).catchError((error) {
      emit(SciencegetDataErrorState(error));
      print('error$error');
    });
  }


  List<dynamic> searchData = [];

  void getsearchData(String searchWord) {
    emit(SearchgetDataLoadingState());
    searchData=[];
    DioHelper.getData(url: 'v2/everything', Query: {
      'q': searchWord,
      'apiKey': 'c8c606a8d9a94bb0bd9fa6faee2d8568'
    }).then((value) {
      searchData = value.data['articles'];
      print(searchData.length);
      print(searchData[0]["title"]);
      emit(SearchgetDataSecufulState());
    }).catchError((error) {
      print(error);
      emit(SearchgetDataErrorState(error));
    });
  }

}

