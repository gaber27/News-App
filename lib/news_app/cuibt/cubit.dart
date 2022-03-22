import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_app/cuibt/states.dart';
import 'package:news_app/shared/dio_helper.dart';
import '../../../moduls/news_app/business/business_screen.dart';
import '../../../moduls/news_app/science/Sciencs.dart';
import '../../../moduls/news_app/sports/Sports_screen.dart';
import 'package:news_app/shared/local/cash_helper.dart';


class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitalState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon
        (
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon
        (
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon
        (
        Icons.science,
      ),
      label: 'Science',
    ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    SciencsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if(index == 0)
      getBusiness();
    if (index == 1)
      getSports();
    if (index == 2)
      getScience();
    emit(NewsBottomNavState());
  }
  bool isDark=false;
  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null)
    {
      isDark= fromShared;
      emit(AppChangeModeState());
    }else
    {
      isDark=!isDark;
    }
  cachHelper.putData(key: 'isDark', value: isDark).then((value)
  {
  emit(AppChangeModeState());
  });
}
  List<dynamic>bs=[];
  void getBusiness()
  {
      emit(NewsGetBusinessLoadingState());
      DioHelper.getData(url: 'v2/top-headlines/',
        query:
        {
          'country':'eg',
          'category':'business',
          'apiKey':'1cf06b23bde8468fbcf5dd42f0fda9e9',
        },
      ).then((value)
      {
        bs=value.data['articles'];
        print(bs);
        emit(NewsGetBusinessSuccessState());
      }
      ).catchError((error)
      {
        print(error.toString());
        emit(NewsGetBusinessErorrState(error.toString()));
      });
  }
  List<dynamic>sports=[];
  void getSports()
  {
    if(sports.length==0)
    {
      emit(NewsGetSportsLoadingState());
      DioHelper.getData(url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'sports',
          'apiKey':'1cf06b23bde8468fbcf5dd42f0fda9e9',
        },
      ).then((value)
      {

        sports=value.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportsSuccessState());
      }
      ).catchError((error)
      {
        print(error.toString());
        emit(NewsGetSportsErorrState(error.toString()));
      });
    }else
    {
      emit(NewsGetSportsSuccessState());
    }

  }

  List<dynamic>science=[];
  void getScience()
  {
    if(science.length==0)
    {
      DioHelper.getData(url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'science',
          'apiKey':'1cf06b23bde8468fbcf5dd42f0fda9e9',
        },
      ).then((value)
      {
        science=value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());
      }
      ).catchError((error)
      {
        print(error.toString());
        emit(NewsGetScienceErorrState(error.toString()));
      });
    }else
    {
      emit(NewsGetScienceLoadingState());
    }

  }

  List<dynamic>search=[];
  void getsearch(String value)
  {
    search =[];
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: 'v2/everything',
      query:
      {

        'q':'$value',
        'apiKey':'1cf06b23bde8468fbcf5dd42f0fda9e9',
      },
    ).then((value)
    {
      search=value.data['articles'];
      print(search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(NewsGetSearchErorrState(error.toString()));
    });


  }
}