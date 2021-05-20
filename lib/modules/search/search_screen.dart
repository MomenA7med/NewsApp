import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_eg/cubit/cubit.dart';
import 'package:news_eg/cubit/states.dart';
import 'package:news_eg/shared/components.dart';

class SearchScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    // TODO: implement build
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (String value){
                    if(value.isEmpty){
                      return 'can not be empty';
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              ConditionalBuilder(
                condition: list.length > 0,
                builder: (context){
                  return Expanded(
                    child: ListView.separated(
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
                        itemCount: list.length),
                  );
                },
                fallback: (context) => Center(child: CircularProgressIndicator(),),
              ),
            ],
          ),
        );
      },
    );
  }
}