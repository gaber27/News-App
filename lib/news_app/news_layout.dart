import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_app/cuibt/states.dart';
import 'package:news_app/news_app/cuibt/cubit.dart';
import 'package:news_app/shared/components.dart';
import '../moduls/search/search_screen.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
                'News App'
            ),
            actions: [
              IconButton(onPressed: ()
              {
                navigateto(context,SearchScreen());
              },
                  icon: Icon(
                    Icons.search,
                  ),
              ),
              IconButton(onPressed: ()
              {
                NewsCubit.get(context).changeAppMode();
              },
                  icon: Icon(
                    Icons.brightness_4_outlined,
                  ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar
            (
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },
            currentIndex:  cubit.currentIndex,
              items:cubit.bottomItems,
          ),
        );
      },
    );
  }
}
