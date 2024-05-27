import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../app/feature/character/bloc/character_bloc.dart';
import '../../app/feature/character/repositories/character_repository_impl.dart';
import '../../app/feature/character/repositories/character_repository_interface.dart';
import '../services/http/http_client_impl.dart';
import '../services/http/http_service_interface.dart';

setupProviders() {
  GetIt i = GetIt.instance;
  //i.registerLazySingleton<http.Client>(() => http.Client());
  i.registerLazySingleton<HttpServiceInterface>(() => HttpClientImpl(http.Client()));
  i.registerLazySingleton<CharacterRepositoryInterface>(() => CharacterRepositoryImpl(
      httpClient: i()
  ));
  i.registerLazySingleton(() => CharacterBloc(characterRepository: i()));
}