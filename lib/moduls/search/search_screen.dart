import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_app/cuibt/states.dart';
import 'package:news_app/news_app/cuibt/cubit.dart';
import 'package:news_app/shared/components.dart';

class SearchScreen extends StatelessWidget {
  var searchControler = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(

          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormFiled(
                  controller: searchControler,
                  type: TextInputType.text,
                  onChange: (value)
                  {
                     NewsCubit.get(context).getsearch(value!);
                  },
                  Validate:(value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  label:'Search' ,
                  Prefix: Icons.search,
                ),
              ),
              Expanded(child: articalBulider(list, context,isSearch: true))
            ],
          ),
        );
    },
    );
  }
}
