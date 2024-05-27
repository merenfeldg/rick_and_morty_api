import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/character_model.dart';
import '../repositories/character_repository_interface.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {

  final CharacterRepositoryInterface _characterRepository;

  CharacterBloc({
    required CharacterRepositoryInterface characterRepository
  }) : _characterRepository = characterRepository,
        super(CharacterInitial()) {

    on<CharacterEvent>((event, emit) async {
      await _characterRepository.getCharacter().then((response) => (
        response.fold(
                (error) => emit(CharacterError(error.toString())),
                (list) => emit(CharacterSuccess(list))
        )
      ));
    });
    on<GetCharacterById>((event, emit) {});
  }
}
