import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculator',
        theme: new ThemeData(primarySwatch: Colors.green),
        home: new CalculatorScreen());
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}





class _CalculatorScreenState extends State<CalculatorScreen> {

  String _output="0",out="0";
  double ans=0,one=0,two=0;
  String operand="";

  buttonPress(String t) {

    setState(() {

      if(t=="Clear")
        {
          _output="0";
          out="0";
          one=0;
          two=0;
          ans=0;
          operand="";
          ans=0;
        }
        else if(t=='/' || t=='X' || t=='-' || t=='+')
          {
            operand=t;
            one=double.parse(_output);
            _output=_output+t;
            out="0";
          }
          else if(_output=="0")
            {
              _output=t;
              out=t;
            }
            else if(t==".")
              {
                if(operand=="")
                  {
                    if(_output.toString().contains("."))
                      {
                        return;
                      }else{
                      _output=_output+".";
                    }
                  }
                  else
                    if(out.contains("."))
                    {
                      return;
                    } else
                      {
                        out=out+".";
                        _output=_output+'.';
                      }
              }

            else
              {
                if(t=="=")
                  {
                    two=double.parse(out);
                    switch(operand)
                    {
                      case "/":
                        _output=(one/two).toStringAsFixed(2);
                        break;
                      case "+":
                        _output=(one+two).toStringAsFixed(2);
                        break;
                      case "X":
                        _output=(one*two).toStringAsFixed(2);
                        break;
                      case "-":
                        _output=(one-two).toStringAsFixed(2);
                        break;
                    }
                  }else
                    {
                      if(out=="0")
                        {
                          out=t;
                        }
                        else out=out+t;
                      _output=_output+t;
                    }
              }

    });
  }

  Widget buildButton(String text)
  {
    return new Expanded(
      child: new OutlineButton(
        onPressed: ()=>  buttonPress(text) ,
        padding: EdgeInsets.all(28),
        child: new Text(text,
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold
          ),),
        textColor: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Calculator'),
      ),
      body:new Container(
        child: new Column(
          children: <Widget>[

            new Container(
              margin: EdgeInsets.only(top: 130.0),
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(
                horizontal: 10.0
              ),
              child: new Text(_output,
              style: TextStyle(
                fontSize: 40.0,
                decorationStyle: TextDecorationStyle.dotted,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            new Expanded(
              child:new Divider()
      ),
               new Column(children:
                   [

                     new Row(
                       children: <Widget>[
                         buildButton("7"),
                         buildButton("8"),
                         buildButton("9"),
                         buildButton("/")

                       ],
                     ),
                     new Row(
                       children: <Widget>[
                         buildButton("4"),
                         buildButton("5"),
                         buildButton("6"),
                         buildButton("X")

                       ],
                     ),
                     new Row(
                       children: <Widget>[
                         buildButton("1"),
                         buildButton("2"),
                         buildButton("3"),
                         buildButton("-")

                       ],
                     ),
                     new Row(
                       children: <Widget>[
                         buildButton("."),
                         buildButton("0"),
                         buildButton("00"),
                         buildButton("+")

                       ],
                     ),
                     new Row(
                       children: <Widget>[
                         buildButton("Clear"),
                         buildButton("="),

                       ],
                     )
                   ]

               ),
    ]
      ),
      )
    );
  }
}
