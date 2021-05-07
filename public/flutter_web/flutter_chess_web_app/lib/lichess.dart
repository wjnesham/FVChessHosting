import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chess_web_app/TournamentPost.dart';
import 'package:http/http.dart' as http;

// String getLichessPostBody() {
//   Map<String, dynamic> details = {
//     'name': "Furry Valley Tournament",
//     'clockTime': 5,
//     'clockIncrement': 5,
//     'minutes': 60,
//     'waitMinutes': 60,
//     'startDate': 0,
//     'berserkable': false,
//     'description': "Furries Play Chess",
//     'password': "Dragon"
//   };
//   String jsonString = json.encode(details);
//
//   return jsonString;
// }

Future<String> createTournament() async {
  var url = Uri.parse("https://lichess.org/api/tournament");

  const personalToken = "HJ2cmeGilSN3MIvf"; // const personalToken = [your_token];

  // String formBody = getLichessPostBody();

  // TODO
  TournamentPost tournamentPost = new TournamentPost(
      name: "Furry Valley Tournament",
      clockTime: 5,
      clockIncrement: 5,
      minutes: 60,
      waitMinutes: 60,
      startDate: 0,
      berserkable: false,
      description: "Purrr~ <3",
      password: "uwu");


  // pass headers parameters if any
  // await http.post(
  //     url,
  //     headers: <String, String>{
  //       'Authorization': 'Bearer $personalToken'
  //     },
  //     body: tournamentPost.toMap());


  //     .then((http.Response response) {
  //   final int statusCode = response.statusCode;
  //
  //   if (statusCode < 200 || statusCode >= 400) {
  //     throw new Exception("Error while fetching data");
  //   }
  //   return json.decode(response.body);
  // }).then((value) => {
  //   print('done wth ytytdytdytdytdytd'),
  // print('Respinse = $value')
  // });


  //
  // if (response.statusCode == 200) {
  //   // url hit successful
  //   // String data = response.body;
  //   // debugPrint("Response = $response");
  //   // debugPrint("Data = $data");
  //   return json.decode(response.body);
  //   // return get_prod.fromJson( json.decode(response.body) );
  // } else {
  //   print('failed to get data. Response = $response');
  //   throw Exception('Failed to get data');

  return "Doneee";
}
