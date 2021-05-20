import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_eg/cubit/states.dart';
import 'package:news_eg/modules/business/business_screen.dart';
import 'package:news_eg/modules/science/science_screen.dart';
import 'package:news_eg/modules/sports/sports_screen.dart';
import 'package:news_eg/network/dio_helper.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit() : super(NewInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<dynamic> business = [];

  List<dynamic> sports = [];

  List<dynamic> sciences = [];

  List<dynamic> search = [];


  List<BottomNavigationBarItem> bottomsItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(index){
    currentIndex = index;
    emit(NewBottomNavState());
  }

  void getBusiness(){
    emit(NewBusinessLoadingState());
    DioHelper.getData(
        path: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'business',
          'apiKey' : 'e6277f1b33144203b52d033c4e65004d',
        }).
    then((value) {
      business = value.data['articles'];
      //print(business[0]['title']);
      emit(NewBusinessSuccessState());
    }).catchError((onError){
      print(onError.toString());
      emit(NewBusinessFailedState(onError.toString()));
    });
  }

  void getSports(){
    emit(NewSportsLoadingState());
    DioHelper.getData(
        path: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'sports',
          'apiKey' : 'e6277f1b33144203b52d033c4e65004d',
        }).
    then((value) {
      sports = value.data['articles'];
      //print(business[0]['title']);
      emit(NewSportsSuccessState());
    }).catchError((onError){
      print(onError.toString());
      emit(NewSportsFailedState(onError.toString()));
    });
  }

  void getSciences(){
    emit(NewScienceLoadingState());
    DioHelper.getData(
        path: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'science',
          'apiKey' : 'e6277f1b33144203b52d033c4e65004d',
        }).
    then((value) {
      sciences = value.data['articles'];
      //print(business[0]['title']);
      emit(NewScienceSuccessState());
    }).catchError((onError){
      print(onError.toString());
      emit(NewScienceFailedState(onError.toString()));
    });
  }

  void getSearch(String searchValue){
    emit(NewSearchLoadingState());
    DioHelper.getData(
        path: 'v2/everything',
        query: {
          'q' : searchValue,
          'apiKey' : 'e6277f1b33144203b52d033c4e65004d',
        }).
    then((value) {
      search = value.data['articles'];
      //print(business[0]['title']);
      emit(NewSearchSuccessState());
    }).catchError((onError){
      print(onError.toString());
      emit(NewSearchFailedState(onError.toString()));
    });
  }
}