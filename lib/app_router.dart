// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tv_show/constants/strings.dart';
import 'package:tv_show/presentation/screens/characte_details.dart';
import 'package:tv_show/presentation/screens/characters_screen.dart';

class AppRouter {
  Route? generteRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(builder: (_) => CharactersScreen());
      case characteDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacteDetailsScreen());
      default:
    }
  }
}
