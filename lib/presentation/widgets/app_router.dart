import 'package:bloxtest/business_logic/cubit/character_cubit.dart';
import 'package:bloxtest/data/model/characters.dart';
import 'package:bloxtest/data/repsitory/character_repository.dart';
import 'package:bloxtest/data/web_srevices/character_web_services.dart';
import 'package:bloxtest/presentation/screens/characters_details.dart';
import 'package:bloxtest/constans/strings.dart';
import 'package:bloxtest/presentation/screens/characters_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharacterCubit characterCubit;

  AppRouter() {
    characterRepository = CharacterRepository(CharacterWebServices());
    characterCubit = CharacterCubit(characterRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CharactersScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => characterCubit,
            child: CharactersScreens(),
          ),
        );
      case CharactersDeatials:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (context) => CharactersDetailsScreen(character: character,),
        );
    }
  }
}
