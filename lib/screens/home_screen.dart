import 'package:flutter/material.dart';
import 'package:snooker_score_maintainer/screens/logs_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _colorBalls = ["assets/white.png","assets/red.png","assets/yellow.png","assets/green.png","assets/brown.png","assets/blue.png","assets/pink.png","assets/black.png"];
  bool pressAttention_team1 = true;
  List<int> _TeamOneScore = new List();
  int _teamOneFinalScore=0,_teamTwoFinalScore=0;
  List<int> _TeamTwoScore= new List();
  bool foulPressed = false;

  int scoreDiff = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Snooker Score Maintainer",style: TextStyle(fontSize: 15),),
      actions: <Widget>[
        SizedBox(width: 5,),
        ButtonTheme(
          minWidth: 50.0,
          height: 50.0,
          buttonColor: Colors.black45,
          child: RaisedButton(
            child: Text("Reset",style: TextStyle(color: Colors.white),),
            onPressed: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirmation'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Do you want to Reset'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Yes'),
                        onPressed: () {
                          setState(() {
                            _resetValues();
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );

            },
          ),
        ), //Reset Button
        SizedBox(width: 5,),
        ButtonTheme(
          minWidth: 50.0,
          height: 50.0,
          buttonColor: Colors.black45,
          child: RaisedButton(
            child: Text("Finish",style: TextStyle(color: Colors.white),),
            onPressed: () {
              if(_teamOneFinalScore!=0 || _teamTwoFinalScore !=0) {
                if (_teamOneFinalScore > _teamTwoFinalScore) {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Final Result'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('Team One Won.'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Finish'),
                            onPressed: () {
                              setState(() {
                               _resetValues();
                              });

                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
                else if(_teamTwoFinalScore > _teamOneFinalScore){
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Final Result'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('Team Two Won.'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Finish'),
                            onPressed: () {
                              setState(() {
                                _teamTwoFinalScore = 0;
                                _teamOneFinalScore = 0;
                                _TeamOneScore = new List();
                                _TeamTwoScore = new List();
                              });

                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
                else {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Final Result'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('Match Tied!'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Finish'),
                            onPressed: () {
                              setState(() {
                                _teamTwoFinalScore = 0;
                                _teamOneFinalScore = 0;
                                _TeamOneScore = new List();
                                _TeamTwoScore = new List();
                              });

                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            },
          ),
        ), //Finsh Button
      ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(child: Text("Team 1",style: TextStyle(color: Colors.white),),onPressed: () {
                if(pressAttention_team1 == false)
                setState(() => pressAttention_team1 = !pressAttention_team1);
              },
                color: pressAttention_team1 ? Colors.blue : Colors.grey,),
              RaisedButton(child: Text("Team 2",style: TextStyle(color: Colors.white)),onPressed: () {
                if(pressAttention_team1 == true)
                setState(() => pressAttention_team1 = !pressAttention_team1);
              },
                color:pressAttention_team1? Colors.grey : Colors.blue),
            ],
          ), //Display Team 1 and Team 2 Text
          SizedBox(height:20 ,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("$_teamOneFinalScore",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Oxanium'),),
                Text("$_teamTwoFinalScore",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Oxanium'),)
              ],
            ),
          ),//Display Team 1 and Team 2 Score
          SizedBox(height:20 ,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Score Difference : ",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Padding(
                padding: EdgeInsets.all(8),
                child: _teamOneFinalScore < _teamTwoFinalScore ? Text("$scoreDiff",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal)) : Text('$scoreDiff',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal)),
              )
            ],
          ),//Display Score Difference
          
          SizedBox(height:20 ,),
          Center(
            child: Container(
              color: Colors.black12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _BallsIconButton(_colorBalls[0],0),
                      _BallsIconButton(_colorBalls[1],1),
                      _BallsIconButton(_colorBalls[2],2),
                      _BallsIconButton(_colorBalls[3],3),
                      //  IconButton(icon: Image.asset("assets/"),onPressed: () {},)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _BallsIconButton(_colorBalls[4],4),
                      _BallsIconButton(_colorBalls[5],5),
                      _BallsIconButton(_colorBalls[6],6),
                      _BallsIconButton(_colorBalls[7],7),
                    ],
                  )
                ],
              ),
            ),
          ), //Displaying the Colour Balls
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(child: Text("Foul",style: TextStyle(color: Colors.white),),
              color: foulPressed ?  Colors.redAccent: Colors.grey,
              onPressed: () {
                setState(() {
                  foulPressed = !foulPressed;
                });
              },)
            ],
          ), //Foul Button
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(child: Text("Logs Team 1",style: TextStyle(color: Colors.white),),
                color: Colors.grey,
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>LogsScreen(_TeamOneScore)) );
                },),
              SizedBox(width: 50,),
              RaisedButton(child: Text("Logs Team 2",style: TextStyle(color: Colors.white),),
                color: Colors.grey,
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>LogsScreen(_TeamTwoScore)) );
                },)
            ],
          ) //Logs of Team 1 and Team 2

        ],

      )
    );
  }

  Widget _BallsIconButton(String colorBall, int colorIndex) {
    return IconButton(
      iconSize: 80,
      icon: Image.asset(colorBall),onPressed: () {
       switch(colorIndex) {
         case 0 :
           {
             setState(() {
               if(foulPressed) {
                 pressAttention_team1 ?  (_teamOneFinalScore = _teamOneFinalScore - 4) :  (_teamTwoFinalScore = _teamTwoFinalScore - 4);
                 pressAttention_team1 ? _TeamOneScore.add(-4) :_TeamTwoScore.add(-4);
                 scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
                 foulPressed = false;
               } else {
               pressAttention_team1 ? (_teamOneFinalScore = _teamOneFinalScore - 4) :  (_teamTwoFinalScore = _teamTwoFinalScore - 4);
               pressAttention_team1 ? _TeamOneScore.add(-4) :_TeamTwoScore.add(-4);
               scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
               }
             });

           }
               break;

         case 1  : {
           setState(() {
             if(foulPressed) {
               pressAttention_team1 ?  (_teamOneFinalScore = _teamOneFinalScore - 4) :  (_teamTwoFinalScore = _teamTwoFinalScore - 4);
               pressAttention_team1 ? _TeamOneScore.add(-4) :_TeamTwoScore.add(-4);
               scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
               foulPressed = false;
             } else {
             pressAttention_team1 ? (_teamOneFinalScore = _teamOneFinalScore +1) :  (_teamTwoFinalScore = _teamTwoFinalScore +1);
             pressAttention_team1 ? _TeamOneScore.add(1) :_TeamTwoScore.add(1);
             scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
             }
           });
         }
         break;

         case 2  : {

           setState(() {
             if(foulPressed) {
               pressAttention_team1 ?  (_teamOneFinalScore = _teamOneFinalScore - 4) :  (_teamTwoFinalScore = _teamTwoFinalScore - 4);
               pressAttention_team1 ? _TeamOneScore.add(-4) :_TeamTwoScore.add(-4);
               scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
               foulPressed = false;
             }else {
             pressAttention_team1 ? (_teamOneFinalScore = _teamOneFinalScore +2) :  (_teamTwoFinalScore = _teamTwoFinalScore +2);
             pressAttention_team1 ? _TeamOneScore.add(2) :_TeamTwoScore.add(2);
             scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
             }
           });
         }
         break;

         case 3  : {
           setState(() {
             if(foulPressed) {
               pressAttention_team1 ?  (_teamOneFinalScore = _teamOneFinalScore - 4) :  (_teamTwoFinalScore = _teamTwoFinalScore - 4);
               pressAttention_team1 ? _TeamOneScore.add(-4) :_TeamTwoScore.add(-4);
               scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
               foulPressed = false;
             } else {
             pressAttention_team1 ? (_teamOneFinalScore = _teamOneFinalScore +3) :  (_teamTwoFinalScore = _teamTwoFinalScore +3);
             pressAttention_team1 ? _TeamOneScore.add(3) :_TeamTwoScore.add(3);
             scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
             }
           });
         }
         break;

         case 4  : {
           setState(() {
             if(foulPressed) {
               pressAttention_team1 ?  (_teamOneFinalScore = _teamOneFinalScore - 4) :  (_teamTwoFinalScore = _teamTwoFinalScore - 4);
               pressAttention_team1 ? _TeamOneScore.add(-4) :_TeamTwoScore.add(-4);
               scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
               foulPressed = false;
             } else {
             pressAttention_team1 ? (_teamOneFinalScore = _teamOneFinalScore +4) :  (_teamTwoFinalScore = _teamTwoFinalScore +4);
             pressAttention_team1 ? _TeamOneScore.add(4) :_TeamTwoScore.add(4);
             scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
             }
           });
         }
         break;

         case 5  : {
           setState(() {
             if(foulPressed) {
               pressAttention_team1 ? (_teamOneFinalScore = _teamOneFinalScore -5) :  (_teamTwoFinalScore = _teamTwoFinalScore -5);
               pressAttention_team1 ? _TeamOneScore.add(-5) :_TeamTwoScore.add(-5);
               scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
               foulPressed = false;
             } else {
             pressAttention_team1 ? (_teamOneFinalScore = _teamOneFinalScore +5) :  (_teamTwoFinalScore = _teamTwoFinalScore +5);
             pressAttention_team1 ? _TeamOneScore.add(5) :_TeamTwoScore.add(5);
             scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
             }
           });
         }
         break;

         case 6  : {
           setState(() {
             if(foulPressed) {
               pressAttention_team1 ? (_teamOneFinalScore = _teamOneFinalScore -6) :  (_teamTwoFinalScore = _teamTwoFinalScore -6);
               pressAttention_team1 ? _TeamOneScore.add(-6) :_TeamTwoScore.add(-6);
               scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
               foulPressed = false;
             }else {
             pressAttention_team1 ? (_teamOneFinalScore = _teamOneFinalScore +6) :  (_teamTwoFinalScore = _teamTwoFinalScore +6);
             pressAttention_team1 ? _TeamOneScore.add(6) :_TeamTwoScore.add(6);
             scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
             }
           });
         }
         break;

         case 7  : {
           setState(() {
             if(foulPressed) {
               pressAttention_team1 ? (_teamOneFinalScore = _teamOneFinalScore -7) :  (_teamTwoFinalScore = _teamTwoFinalScore -7);
               pressAttention_team1 ? _TeamOneScore.add(-7) :_TeamTwoScore.add(-7);
               scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
               foulPressed = false;
             } else {
             pressAttention_team1 ? (_teamOneFinalScore = _teamOneFinalScore +7) :  (_teamTwoFinalScore = _teamTwoFinalScore +7);
             pressAttention_team1 ? _TeamOneScore.add(7) :_TeamTwoScore.add(7);
             scoreDiff = _teamTwoFinalScore-_teamOneFinalScore;
             }
           });
         }
         break;
       }
    },
    );
  }

  void _resetValues() {
    _teamTwoFinalScore = 0;
    _teamOneFinalScore = 0;
    scoreDiff = 0;
    _TeamOneScore = new List();
    _TeamTwoScore = new List();
  }
}
