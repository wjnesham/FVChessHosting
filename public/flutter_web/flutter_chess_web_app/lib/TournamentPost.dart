class TournamentPost {
  final String name;
  final int clockTime;
  final int clockIncrement;
  final int minutes;
  final int waitMinutes;
  final int startDate;
  final bool berserkable;
  final String description;
  final String password;

  TournamentPost(
      {required this.name,
      required this.clockTime,
      required this.clockIncrement,
      required this.minutes,
      required this.waitMinutes,
      required this.startDate,
      required this.berserkable,
      required this.description,
      required this.password});

  factory TournamentPost.fromJson(Map json) {
    return TournamentPost(
        name: json['name'],
        clockTime: json['clockTime'],
        clockIncrement: json['clockIncrement'],
        minutes: json['minutes'],
        waitMinutes: json['waitMinutes'],
        startDate: json['startDate'],
        berserkable: json['berserkable'],
        description: json['description'],
        password: json['password']);
  }

  Map toMap() {
    var map = new Map();
    map["name"] = name;
    map["clockTime"] = clockTime;
    map["clockIncrement"] = clockIncrement;
    map["minutes"] = minutes;
    map["waitMinutes"] = waitMinutes;
    map["startDate"] = startDate;
    map["berserkable"] = berserkable;
    map["description"] = description;
    map["password"] = password;

    return map;
  }
}
