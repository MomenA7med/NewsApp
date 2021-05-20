import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_eg/cubit/cubit.dart';
import 'package:news_eg/cubit/states.dart';
import 'package:news_eg/shared/components.dart';

class SportsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state) {},
      builder: (context,state) {
        var list = NewsCubit.get(context).sports;
        return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context){
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index) => buildArticleItem(list[index],context),
                separatorBuilder: (context,index) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                itemCount: list.length);
          },
          fallback: (context) => Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}