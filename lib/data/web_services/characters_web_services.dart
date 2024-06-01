// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:tv_show/constants/strings.dart';
import 'package:tv_show/data/models/characters.dart';

//Dio handling
class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  //web services call
  Future<List<Character>> getAllCharacters() async {
    Dio dio = Dio();

    // The URL you want to request
    String url = 'https://rickandmortyapi.com/api/character';

    try {
      // Make the GET request
      Response response = await dio.get(url);

      // Print the response data
      print('Response data: hello  ${response.data}');

      List<dynamic> results = response.data['results'];
      List<Character> characters =
          results.map((json) => Character.fromJson(json)).toList();

      return characters;
    } catch (e) {
      // Print the error if something went wrong
      print('Error: $e');
      return [];
    }
  }
}
