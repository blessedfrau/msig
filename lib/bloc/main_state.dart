part of 'main_cubit.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class Mainnitial extends MainState {}

class MainStateLoading extends MainState {}

class MainStateFailed extends MainState {
  final String message;

  const MainStateFailed({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'MainStateFailed { message: $message }';
}

class MainStateFoodListSuccess extends MainState {
  final List<MealsModel> foodList;

  const MainStateFoodListSuccess({required this.foodList});

  @override
  List<Object> get props => [foodList];

  @override
  String toString() => 'MainStateFoodList {foodList: $foodList }';
}

class MainStateFoodListDetailSuccess extends MainState {
  final List<MealsDetailModel> foodListDetail;

  const MainStateFoodListDetailSuccess({required this.foodListDetail});

  @override
  List<Object> get props => [foodListDetail];

  @override
  String toString() =>
      'MainStateFoodListDetailSuccess {foodListDetail: $foodListDetail }';
}
