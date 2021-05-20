import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_eg/cubit/app_states.dart';
//import 'package:news_eg/shared/cashe_helper.dart';

class AppCubit extends Cubit<AppState>{

  AppCubit() : super(AppInitailState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool fromShared}){
    // if(fromShared != null){
    //   isDark = fromShared;
    //   emit(AppChangeModeState());
    // }
    // else{
    //   isDark = !isDark;
    //   CacheHelper.putData(key: 'isDark', isDark: isDark).then((value) {
    //     emit(AppChangeModeState());
    //   });
    // }
    isDark = !isDark;
    emit(AppChangeModeState());
  }
}