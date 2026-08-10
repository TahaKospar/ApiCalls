class Character {
  late String name;
  late int charId;
  late String status;
  late String species;
  late String gender;
  late String image;
  late String created;
  late String url;
  late Map<String, dynamic> origin;
  late Map<String, dynamic> location;
  late List< dynamic> episode;

  Character.fromJson(Map<String, dynamic> json) {
    charId = json["id"];
    name = json["name"];
    status = json["status"];
    species = json["species"];
    gender = json["gender"];
    image = json["image"];
    created = json["created"];
    url = json["url"];
    origin = json["origin"];
    location = json["location"];
    episode = json["episode"];
  }
}
