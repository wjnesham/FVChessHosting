import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messages {
  static final String title = "Furry Valley Chess";
  static String message60(String day, String link, String password, String inTime) {
    return """@Chess
    Heyo Chess Floofs! In $inTime minutes is the $day Night Chess tournament!
    We will be in the chess VC if you want to talk with other Floofs!
    Hope to see you there and good luck!
    Link: $link
    Password: $password""";
  }

  static String message30(String day, String link, String password) {
    return """`Hey floof! In 30 minutes we are going to have the $day Chess Tournament of Furry Valley! If
  you want to join us, use the link and password given below! Also, you can join the VC to talk to others while
  playing some chess. Hope to see you there!
  Link: $link
  Password: $password
  `""";
  }


  static Widget messageContainer(String message, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Center(
        child: Text(
          message,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

}