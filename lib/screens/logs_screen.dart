import 'package:flutter/material.dart';
class LogsScreen extends StatefulWidget {
  List<int> _scoresList;

  LogsScreen(this._scoresList);
  @override
  _LogsScreenState createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logs"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Scores List",style: TextStyle(fontSize: 40),),
            SizedBox(height: 20),
            Wrap(
            children: <Widget>[
              Text(widget._scoresList.toString(),style: TextStyle(fontSize: 25),)
            ],

            )


          ],
        ),
      ),
    );
  }
}
