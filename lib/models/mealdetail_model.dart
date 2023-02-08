import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mealdetail_model.g.dart';

@JsonSerializable()
class MealsDetailModel extends Equatable {
  final String strMeal,
      strMealThumb,
      idMeal,
      strCategory,
      strArea,
      strInstructions,
      strTags,
      strYoutube,
      strIngredient1,
      strIngredient2,
      strIngredient3,
      strIngredient4,
      strIngredient5,
      strIngredient6,
      strIngredient7;

  const MealsDetailModel({
    this.idMeal = '',
    this.strMeal = '',
    this.strMealThumb = '',
    this.strCategory = '',
    this.strArea = '',
    this.strInstructions = '',
    this.strTags = '',
    this.strYoutube = '',
    this.strIngredient1 = '',
    this.strIngredient2 = '',
    this.strIngredient3 = '',
    this.strIngredient4 = '',
    this.strIngredient5 = '',
    this.strIngredient6 = '',
    this.strIngredient7 = '',
  });
  factory MealsDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MealsDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$MealsDetailModelToJson(this);

  @override
  List<Object> get props => [];
}
