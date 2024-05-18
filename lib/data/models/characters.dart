class Character {
  late int id;
  late String name;
  late String statusIfDeadOrAlive;
  late String image;
  late String gender;
  late String species;
  late List<dynamic> apperanceOfEpisods;

  Character.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    statusIfDeadOrAlive = json["status"];
    image = json["image"];
    gender = json["gender"];
    species = json["species"];
    apperanceOfEpisods = json["episode"];
  }
}
