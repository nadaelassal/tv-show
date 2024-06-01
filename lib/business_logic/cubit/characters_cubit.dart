import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tv_show/data/models/characters.dart';
import 'package:tv_show/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

//get data from repository
  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(
          characters)); //emit -> emit state (character state ->characters loaded) -> send to ui
      this.characters = characters;
    });
    return characters;
  }
}
