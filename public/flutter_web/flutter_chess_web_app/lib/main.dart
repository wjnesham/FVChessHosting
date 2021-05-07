import 'package:flutter/material.dart';
import 'package:flutter_chess_web_app/messages.dart';

import 'lichess.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Messages.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(key: Key("HomePage"), title: Messages.title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String msg1 = "", msg2 = "", msg3 = "";

  Future<void> _incrementCounter() async {
    await createTournament();
    setState(() {
      _counter++;
      String day = "Tuesday", link = "LINK", password = "Dragon";
      msg1 = Messages.message60(day, link, password, "60");
      msg2 = Messages.message30(day, link, password);
      msg3 = Messages.message60(day, link, password, "5");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline6,
              ),
              Messages.messageContainer(msg1, context),
              Messages.messageContainer(msg2, context),
              Messages.messageContainer(msg3, context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
