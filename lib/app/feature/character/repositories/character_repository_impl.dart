import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_api/app/feature/character/model/character_model.dart';
import 'package:rick_and_morty_api/app/feature/character/repositories/character_repository_interface.dart';
import 'package:rick_and_morty_api/shared/services/http/http_service_interface.dart';

import '../../../../shared/services/http/http_client_impl.dart';

class CharacterRepositoryImpl implements CharacterRepositoryInterface {

  final HttpServiceInterface httpClient;
  final String _urlApi= 'https://rickandmortyapi.com/api/character';


  CharacterRepositoryImpl({required this.httpClient});

  @override
  Future<Either<Exception, List<Character>>> getCharacter() async {
    final response = await httpClient.get(url: _urlApi);

    if(response.statusCode == 200) {
      final List<Character> characters = [];
      final data = jsonDecode(response.body)['results'] as List<dynamic>;
      for(var item in data) {
        characters.add(Character.fromJson(item));
      }
      return Right(characters);
    }
    else {
      return Left(Exception('Error'));
    }
  }
}