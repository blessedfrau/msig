import 'package:msig/models/mealdetail_model.dart';
import 'package:msig/models/meals_model.dart';

abstract class MainService {
  Future<List<MealsModel>> getFoodList();
  Future<List<MealsDetailModel>> getFoodDetail(int idHeader);
}
