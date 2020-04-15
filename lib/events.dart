import 'package:flutter/material.dart';

import 'starfield_example.dart';
import 'package:mathrix20/event.dart';

Color cardColor = Colors.deepOrange;

class EventSelection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mathrix 20',
      theme: ThemeData(
        primarySwatch: cardColor,
      ),
      home: Scaffold(
        appBar:AppBar(
          backgroundColor: cardColor,
          title: Row(
            children:<Widget>[
              BackButton(color: Colors.white,onPressed: (){Navigator.pop(context);},),
              Container(width: 30),
              Text("Events")
            ]
          ),
        ),
        body: Container(
          color:Colors.black,
          child:Stack(
          alignment:Alignment.center,
          children: <Widget>[
            LayoutBuilder(builder: (context, constraints) {      
            return StarfieldExample(
                maxWidth: constraints.maxWidth, maxHeight: constraints.maxHeight);
          }),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 50,
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  Container(
                    height: 150,
                    width: 150,
                    child: GestureDetector(
                      child: Card(
                        color: cardColor,
                        child:Center(child: Text("Code Relay",style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),),
                      ),
                      onTap:(){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Event("cr")),(route)=>false);
                      }
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: GestureDetector(
                      child: Card(
                        color: cardColor,
                        child:Center(child: Text("Brainstrom",style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),),
                      ),
                      onTap:(){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Event("bs")),(route)=>false);
                      }
                    ),
                  ),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  Container(
                    height: 150,
                    width: 150,
                    child: GestureDetector(
                      child: Card(
                        color: cardColor,
                        child:Center(child: Text("Sherlock",style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),),
                      ),
                      onTap:(){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Event("sh")),(route)=>false);
                      }
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: GestureDetector(
                      child: Card(
                        color: cardColor,
                        child:Center(child: Text("Beat the clock",style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),),
                      ),
                      onTap:(){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Event("bc")),(route)=>false);
                      }
                    ),
                  ),
                ],),
                Divider(color: cardColor,thickness: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  Container(
                    height: 150,
                    width: 150,
                    child: GestureDetector(
                      child: Card(
                        color: cardColor,
                        child:Center(child: Text("Math Quiz",style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),),
                      ),
                      onTap:(){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Event("mq")),(route)=>false);
                      }
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: GestureDetector(
                      child: Card(
                        color: cardColor,
                        child:Center(child: Text("Treasure Hunt",style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),),
                      ),
                      onTap:(){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Event("th")),(route)=>false);
                      },
                    ),
                  ),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  Container(
                    height: 150,
                    width: 150,
                    child: GestureDetector(
                      child: Card(
                        color: cardColor,
                        child:Center(child: Text("Sudoku",style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),),
                      ),
                      onTap:(){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Event("su")),(route)=>false);
                      }
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: GestureDetector(
                      child: Card(
                        color: cardColor,
                        child:Center(child: Text("Creative Math",style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),),
                      ),
                      onTap:(){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Event("cm")),(route)=>false);
                      }
                    ),
                  ),
                ],),
              ]
            )
          ),])
        ),
      )
    );
  }
}