abstract class NewsStates {}

class IntinalState extends NewsStates {}

class ChangeBottomNavBarState extends NewsStates {}

class BusinessgetDataLoadingState extends NewsStates {}

class BusinessgetDataSecufulState extends NewsStates {}

class BusinessgetDataErrorState extends NewsStates {
  final String error;

  BusinessgetDataErrorState(this.error);
}
class SportsgetDataLoadingState extends NewsStates {}

class SportsgetDataSecufulState extends NewsStates {}

class SportsgetDataErrorState extends NewsStates {
  final String error;

  SportsgetDataErrorState(this.error);
}
class SciencegetDataLoadingState extends NewsStates {}

class SciencegetDataSecufulState extends NewsStates {}

class SciencegetDataErrorState extends NewsStates {
  final String error;

  SciencegetDataErrorState(this.error);
}
class ModeAppChangeState extends NewsStates {}

class SearchgetDataLoadingState extends NewsStates {}
class SearchgetDataSecufulState extends NewsStates {}
class SearchgetDataErrorState extends NewsStates {
  final String error;

  SearchgetDataErrorState(this.error);
}


