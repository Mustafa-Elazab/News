import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Helper/SharedComponents/HelperMethods.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/states.dart';
class SearchScreen extends StatelessWidget {

  TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var searchData = NewsCubit.get(context).searchData;

      return  Scaffold(
          appBar: AppBar(
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: defaultTextFormField(controller: controller, type: TextInputType.text, label: 'Search',
                    validate_message: 'Enter AnyThing',
                    onChange: (String value){
                      NewsCubit.get(context).getsearchData(value);
                    }),
              ),
              Expanded(child: conditionBuilder(searchData, context,isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
