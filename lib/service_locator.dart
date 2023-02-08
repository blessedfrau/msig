import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'services/main_services.dart';
import 'services/main_services_impl.dart';
import 'shared/widget/logger.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final log = getLogger('ServiceLocator');
  sl.registerLazySingleton<MainService>(
    () => MainServiceImpl(
      dio: sl(),
    ),
  );

  sl.registerLazySingleton(() {
    final BaseOptions options = BaseOptions(
      baseUrl: 'https://www.themealdb.com/api/json/v1/1/',
    );
    Dio dio = Dio(options);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (request, handler) async {
      return handler.next(request);
    }, onError: (e, handler) {
      final response = e.response;
      log.i(response);
    }, onResponse: (response, handler) async {
      return handler.next(response);
    }));
    return dio;
  });
}
