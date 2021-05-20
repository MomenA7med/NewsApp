import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_eg/cubit/app_cubit.dart';
import 'package:news_eg/cubit/cubit.dart';
import 'package:news_eg/cubit/states.dart';
import 'package:news_eg/modules/search/search_screen.dart';
import 'package:news_eg/shared/components.dart';

class NewsLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state) {},
      builder: (context,state){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                  onPressed: (){
                    navigateTo(context,SearchScreen());
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: (){
                    AppCubit.get(context).changeAppMode();
                  },
                  icon: Icon(Icons.brightness_4_sharp)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomsItem,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavBar(index);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}