import 'package:flutter/material.dart';

class Homepage extends StatefulWidget
{
  State createState() =>  _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  Widget buildButton(String string) {
    return Expanded(
      child: OutlineButton(child: Text(
        string, style: TextStyle(fontSize: 2.0, fontWeight: FontWeight.bold),),
          color: Colors.blue,
          textColor: Colors.black,
          onPressed: () => buttonPressed(string),
          padding: EdgeInsets.all(24.0)
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(child: Text("Calculator"))),
        body: Container(
            child: Column(
              children: <Widget>[
                Container(child: Text(output, style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 48.0),),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 12.0),),
                Expanded(child: Divider()),
                Row(
                    children: <Widget>[
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("+"),
                    ]
                ),
                Row(
                    children: <Widget>[
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("-"),
                    ]
                ),
                Row(
                    children: <Widget>[
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),

                      buildButton("*"),
                    ]
                ),
                Row(
                    children: <Widget>[
                      buildButton("."),
                      buildButton("0"),
                      buildButton("00"),
                      buildButton("/")
                    ]
                ),
                Row(
                    children: <Widget>[
                      buildButton("clear"),
                      buildButton("=")
                    ]
                )


              ],

            )
        ));
  }

  buttonPressed(String buttontext) {
    if (buttontext == "clear") {
      _output = "0";
      operand = "";
      num1 = 0.0;
      num2 = 0.0;
    } else if (buttontext == "+" || buttontext == "-" || buttontext == "/" ||
        buttontext == "*") {
      num1 = double.parse(_output);
      operand = buttontext;
      _output = "0";
    }
    else if (buttontext == ".") {
      if (_output.contains(".")) {
        print("ALready a decimal inserted");
        return;
      }
      else {
        _output = _output + buttontext;
      }
    }
    else if (buttontext == "=") {
      num2 = double.parse(_output);
      if (operand == "+")
        _output = (num1 + num2).toString();
      if (operand == "-")
        _output = (num1 - num2).toString();
      if (operand == "*")
        _output = (num1 * num2).toString();
      if (operand == "/")
        _output = (num1 / num2).toString();

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    else {
      output = output + buttontext;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }


}