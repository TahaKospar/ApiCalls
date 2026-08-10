import 'package:bloxtest/data/model/characters.dart';
import 'package:bloxtest/data/web_srevices/character_web_services.dart';

class CharacterRepository {
  final CharacterWebServices characterWebServices;

  CharacterRepository(this.characterWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacters();
    return characters.map((e) => Character.fromJson(e)).toList();
  }
}
