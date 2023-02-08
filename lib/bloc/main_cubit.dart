import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msig/models/mealdetail_model.dart';
import 'package:msig/models/meals_model.dart';
import 'package:msig/service_locator.dart';
import 'package:msig/services/main_services.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(Mainnitial());

  Future<void> getFoodList() async {
    try {
      emit(MainStateLoading());
      List<MealsModel> result = await sl<MainService>().getFoodList();
      emit(MainStateFoodListSuccess(foodList: result));
    } catch (e) {
      emit(const MainStateFailed(message: 'Failed loading host'));
    }
  }

  Future<void> getFoodDetail(int idHeader) async {
    try {
      emit(MainStateLoading());
      List<MealsDetailModel> result =
          await sl<MainService>().getFoodDetail(idHeader);
      emit(MainStateFoodListDetailSuccess(foodListDetail: result));
    } catch (e) {
      emit(const MainStateFailed(message: 'Failed loading host'));
    }
  }
}
