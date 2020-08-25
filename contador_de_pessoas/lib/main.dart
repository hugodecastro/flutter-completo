import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _numPessoa = 0;
  String _infoText = "Pode Entrar!";

  void _changePeople(int delta){
    setState(() {
      _numPessoa += delta;

      if(_numPessoa < 0) {
        _infoText = "Mundo Invertido!";
      } else if(_numPessoa <= 10) {
        _infoText = "Pode Entrar!";
      } else {
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/restaurant.jpg",
            fit: BoxFit.cover, height: 1000.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_numPessoa",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("+1",
                        style:
                        TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () {
                      debugPrint("+1");
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1",
                        style:
                        TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () {
                      debugPrint("-1");
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0))
          ],
        )
      ],
    );
  }
}
