import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //let's start coding our calculator
  //first of all let's declare some variables
  String Output = "0";
  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  PressedButton(String val){
    print(val);

    //Now let's add some condition
    if(val == "C"){

      _out = "0";
      num1 = 0;
      num2 = 0;
      operand = "";

    }else if(val == "+" || val == "-" || val == "*" || val == "/"){
      num1 = double.parse(Output);
      operand = val;
      _out = "0";
      Output = Output + val;

    }else if (val == "."){
      if(_out.contains(".")){
        return;

      }else{
        _out = _out + val;
      }

    }else if(val == "="){
      num2 = double.parse(Output);
      if(operand == "+"){
        _out = (num1 + num2).toString();
      }

      if(operand == "_"){
        _out = (num1 - num2).toString();
      }

      if(operand == "*"){
        _out = (num1 * num2).toString();
      }

      if(operand == "/"){
        _out = (num1 / num2).toString();
      }
      num2 = 0.0;
      num1 = 0.0;

    }else{
      _out = _out + val;
    }
    setState(() {
      Output = double.parse(_out).toStringAsFixed(2);
    });
  }



  //let's create our button widget
  Widget CalcBtn(String Btnval){
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(10.0),

          decoration: BoxDecoration(
              color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                color: Color(0xFF757575),
                offset: Offset(2.0, 2.0),
                blurRadius: 8.0,
                spreadRadius: 1.0,
          ),

              BoxShadow(
                color: Colors.white,
                offset: Offset(-2.0, -2.0),
                blurRadius: 8.0,
                spreadRadius: 1.0,
              ),
              ]
          ),

          child: MaterialButton(
            padding: EdgeInsets.all(24.0),
              
              onPressed: (){
              PressedButton(Btnval);
              },
            
            child: Text(Btnval,style: TextStyle(fontSize: 18.0),),
          )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[300],

          body: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 50.0),

                  child: Text(Output,style: TextStyle(fontSize: 60.0),),
                ),


                Expanded(
                    child: Divider()
                ),

                Column(
                  children: [
                    Row(
                      children: [
                        //Now we will add our custom button
                        CalcBtn("."),
                        CalcBtn("C"),
                        CalcBtn("<"),
                        CalcBtn("*"),
                      ],
                    ),


                    Row(
                      children: [
                        //Now we will add our custom button
                        CalcBtn("7"),
                        CalcBtn("8"),
                        CalcBtn("9"),
                        CalcBtn("/"),
                      ],
                    ),


                    Row(
                      children: [
                        //Now we will add our custom button
                        CalcBtn("4"),
                        CalcBtn("5"),
                        CalcBtn("6"),
                        CalcBtn("+"),
                      ],
                    ),

                    Row(
                      children: [
                        //Now we will add our custom button
                        CalcBtn("1"),
                        CalcBtn("2"),
                        CalcBtn("3"),
                        CalcBtn("-"),
                      ],
                    ),

                    Row(
                      children: [
                        //Now we will add our custom button
                        CalcBtn("0"),
                        CalcBtn("="),

                      ],
                    ),
                  ],
                )
              ],
            ),
          )
          ),
        );
  }
}

