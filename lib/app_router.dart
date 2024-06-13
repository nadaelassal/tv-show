// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_show/business_logic/cubit/characters_cubit.dart';
import 'package:tv_show/constants/strings.dart';
import 'package:tv_show/data/models/characters.dart';
import 'package:tv_show/data/repository/characters_repository.dart';
import 'package:tv_show/data/web_services/characters_web_services.dart';
import 'package:tv_show/presentation/screens/character_details_screen.dart';
import 'package:tv_show/presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  // ignore: body_might_complete_normally_nullable
  Route? generteRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case characteDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharacteDetailsScreen(
                  character: character,
                ));
      default:
    }
  }
}
