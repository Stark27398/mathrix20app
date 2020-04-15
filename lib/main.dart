import 'dart:async';

import 'package:flutter/material.dart';
import "package:flare_flutter/flare_actor.dart";

import 'package:mathrix20/registration.dart';
import 'package:mathrix20/events.dart';
import 'starfield_example.dart';

Color cardColor = Colors.deepOrange;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mathrix 20',
      theme: ThemeData(
        primarySwatch: cardColor,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),() {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new FlareActor("animations/Mathrix20.flr",
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: "logo");
  }
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child:Stack(
          alignment:Alignment.center,
          children: <Widget>[
            LayoutBuilder(builder: (context, constraints) {      
            return StarfieldExample(
                maxWidth: constraints.maxWidth, maxHeight: constraints.maxHeight);
          }),
            Center(
              child:isLoading?CircularProgressIndicator(
                backgroundColor: Color(0x00000000),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
              ):Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 150,
                    width: 150,
                    child: GestureDetector(
                      onTap:(){setState(() {
                          isLoading=true;
                        });
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Registration()), (route) => false);
                        },
                      child: Card(
                        color: cardColor,
                        elevation: 15,
                        child:Center(child:Text("Registration",style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),),
                      )
                    ),
                  ),
                  Container(
                    height: 50,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: GestureDetector(
                      child: Card(
                        color: cardColor,
                        child:Center(child: Text("Events",style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),),
                      ),
                      onTap:(){setState(() {
                        isLoading=true;
                      });
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EventSelection()));
                      setState(() {
                        isLoading=false;
                      });
                      }
                    ),
                  ),
                ],
              )
            )
          ],
        )
      )
    );
  }
}