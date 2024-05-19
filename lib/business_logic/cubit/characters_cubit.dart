import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tv_show/data/models/characters.dart';
import 'package:tv_show/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  late List<Character> characters;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((charaters) {
      emit(CharactersLoaded(charaters));
      this.characters = charaters;
    });
    return characters;
  }
}
