import 'package:bloc/bloc.dart';
import 'package:bloxtest/data/model/characters.dart';
import 'package:bloxtest/data/repsitory/character_repository.dart';
import 'package:meta/meta.dart';
part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository characterRepository;
  List<Character> characters = [];
  CharacterCubit(this.characterRepository) : super(CharacterInitial());
  List<Character> getAllCharacter() {
    characterRepository.getAllCharacters().then((characters) {
      this.characters = characters;
      emit(CharacterLoaded(characters));
    });

    return characters;
  }
}
