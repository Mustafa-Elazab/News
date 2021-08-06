import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Helper/SharedComponents/HelperMethods.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/newcubit.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/modeuls/search/searchScreen.dart';
class newsHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var newsCubit = NewsCubit.get(context);
         return   Scaffold(
           appBar: AppBar(
             title: Text('News App'
             ,style: TextStyle(
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold
               ),),
             actions: [
               IconButton(icon: Icon(Icons.search), onPressed: (){
                      NavigateTo(context,SearchScreen());
               }),
               IconButton(icon: Icon(Icons.brightness_4_outlined), onPressed: (){
                AppCubit.get(context).changeAppMode();
               },
               ),
             ],
           ),
           body: newsCubit.screens[newsCubit.current_index],
           bottomNavigationBar: BottomNavigationBar(
             items:newsCubit.bottomItem,
             currentIndex: newsCubit.current_index,
             onTap:(index) {
                      newsCubit.changebottomnavbar(index);
             },
           ),
         );
      },
    );
  }
}
