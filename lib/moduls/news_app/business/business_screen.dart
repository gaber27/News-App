import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_app/cuibt/states.dart';
import 'package:news_app/news_app/cuibt/cubit.dart';
import 'package:news_app/shared/components.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {} ,
      builder: (context, state) {
        var list= NewsCubit.get(context).bs;
        return articalBulider(list,context);
      } ,
    );
  }
}
