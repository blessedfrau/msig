// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsModel _$MealsModelFromJson(Map<String, dynamic> json) => MealsModel(
      idMeal: json['idMeal'] as String? ?? '',
      strMeal: json['strMeal'] as String? ?? '',
      strMealThumb: json['strMealThumb'] as String? ?? '',
      isFav: json['isFav'] as bool? ?? false,
    );

Map<String, dynamic> _$MealsModelToJson(MealsModel instance) =>
    <String, dynamic>{
      'strMeal': instance.strMeal,
      'strMealThumb': instance.strMealThumb,
      'idMeal': instance.idMeal,
      'isFav': instance.isFav,
    };
