import 'package:dio/dio.dart';
import 'package:msig/models/mealdetail_model.dart';
import 'package:msig/models/meals_model.dart';
import 'package:msig/shared/widget/logger.dart';

import 'main_services.dart';

class MainServiceImpl implements MainService {
  final log = getLogger('MainServiceImpl');
  final Dio dio;

  MainServiceImpl({
    required this.dio,
  });

  @override
  Future<List<MealsModel>> getFoodList() async {
    log.d('getFoodListImpl');
    List<MealsModel> dataMeals = [];
    try {
      final result = await dio.get(
        'filter.php?c=Seafood',
      );
      var data = (result.data['meals'] as List);
      dataMeals = data.map((i) => MealsModel.fromJson(i)).toList();
    } on DioError catch (e) {
      log.e(e);
      throw e.error;
    }
    return dataMeals;
  }

  @override
  Future<List<MealsDetailModel>> getFoodDetail(int idHeader) async {
    log.d('getFoodListImpl');
    List<MealsDetailModel> dataMeals = [];
    try {
      final result = await dio.get(
        'lookup.php?i=$idHeader',
      );
      var data = (result.data['meals'] as List);
      dataMeals = data.map((i) => MealsDetailModel.fromJson(i)).toList();
    } on DioError catch (e) {
      log.e(e);
      throw e.error;
    }
    return dataMeals;
  }
}
