abstract class NewsState{}

class NewInitialState extends NewsState{}

class NewBottomNavState extends NewsState{}

class NewBusinessSuccessState extends NewsState{}

class NewBusinessFailedState extends NewsState{
  final String error;

  NewBusinessFailedState(this.error);
}

class NewBusinessLoadingState extends NewsState{}

class NewSportsSuccessState extends NewsState{}

class NewSportsFailedState extends NewsState{
  final String error;

  NewSportsFailedState(this.error);
}

class NewSportsLoadingState extends NewsState{}

class NewScienceSuccessState extends NewsState{}

class NewScienceFailedState extends NewsState{
  final String error;

  NewScienceFailedState(this.error);
}

class NewScienceLoadingState extends NewsState{}

class NewSearchSuccessState extends NewsState{}

class NewSearchFailedState extends NewsState{
  final String error;

  NewSearchFailedState(this.error);
}

class NewSearchLoadingState extends NewsState{}

