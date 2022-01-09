class Team {
  final int id;
  final String name;
  final String image;
  final String location;
  final String stadium;
  final int capacity;
  final String manager;
  final String captain;
  final double lat;
  final double lng;

  Team(this.id, this.name, this.image, this.location, this.stadium,
      this.capacity, this.manager, this.captain, this.lat, this.lng);

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
        json['id'] as int,
        json['name'],
        json['image'],
        json['location'],
        json['stadium'],
        json['capacity'] as int,
        json['manager'],
        json['captain'],
        json['lat'] as double,
        json['lng'] as double);
  }
}
