import 'package:fpdart/fpdart.dart';

import '../model/character_model.dart';

abstract interface class CharacterRepositoryInterface {
  Future<Either<Exception, List<Character>>> getCharacter();
}