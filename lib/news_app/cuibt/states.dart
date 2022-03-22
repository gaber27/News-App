abstract class NewsStates{}

class NewsInitalState extends NewsStates{}

class NewsBottomNavState extends NewsStates{}

class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErorrState extends NewsStates
{
  final String error;
  NewsGetBusinessErorrState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}

class NewsGetSportsErorrState extends NewsStates
{
  final String error;
  NewsGetSportsErorrState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}

class NewsGetScienceErorrState extends NewsStates
{
  final String error;
  NewsGetScienceErorrState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates{}

class NewsGetSearchSuccessState extends NewsStates{}

class NewsGetSearchErorrState extends NewsStates
{
  final String error;
  NewsGetSearchErorrState(this.error);
}
class AppChangeModeState extends NewsStates{}



