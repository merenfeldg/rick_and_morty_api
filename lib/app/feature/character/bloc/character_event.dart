part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable{
  @override
  List<Object> get props => [];
}
class GetAllCharacter extends CharacterEvent {}

class GetCharacterById extends CharacterEvent {
  final int id;

  GetCharacterById(this.id);

  @override
  List<Object> get props => [id];
}