part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Character> charaters;

  CharactersLoaded(this.charaters);
}
