import 'package:get_it/get_it.dart';

import '../services/home_service.dart';
import '../viewModels/home_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());

  locator.registerLazySingleton<HomeService>(() => HomeService());
}
