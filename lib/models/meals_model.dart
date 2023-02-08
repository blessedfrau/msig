import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meals_model.g.dart';

@JsonSerializable()
class MealsModel extends Equatable {
  final String strMeal, strMealThumb, idMeal;
  bool? isFav;
  MealsModel({
    this.idMeal = '',
    this.strMeal = '',
    this.strMealThumb = '',
    this.isFav = false,
  });
  factory MealsModel.fromJson(Map<String, dynamic> json) =>
      _$MealsModelFromJson(json);
  Map<String, dynamic> toJson() => _$MealsModelToJson(this);

  @override
  List<Object> get props => [
        idMeal,
        strMeal,
        strMealThumb,
      ];
}
