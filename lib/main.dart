import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_app/cuibt/cubit.dart';
import 'package:news_app/news_app/cuibt/states.dart';
import 'package:news_app/Style/themes.dart';
import 'package:news_app/news_app/news_layout.dart';
import 'package:news_app/shared/dio_helper.dart';
import 'package:news_app/shared/local/cash_helper.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await cachHelper.iniit();
  bool? isDark = cachHelper.getData(key: 'isDark');
  if(isDark == null){
    runApp(MyApp(false));
  }else {
    runApp(MyApp(isDark));
  }
}
class MyApp extends StatelessWidget {
  final bool isDark;
   MyApp(this.isDark );
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => NewsCubit()..bs),
        BlocProvider(create: (context) =>NewsCubit()..changeAppMode(
          fromShared: isDark,
        ),),
      ],
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) {

        },
        builder: (context, state) {



          return MaterialApp(debugShowCheckedModeBanner: false,
            theme:  ligthTheme,
            darkTheme: darkTheme,
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home:NewsLayout(),
          );
        },
      ),
    );
  }
}