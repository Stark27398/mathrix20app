import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import 'package:mathrix20/main.dart';

Color cardColor = Colors.white;

class Registration extends StatelessWidget {
  const Registration({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title:Row(
          children:<Widget>[
            Text("Registration Desk",style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),
            Expanded(
              child:Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    Icons.home,
                    color:Colors.white
                  ),
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (route) => false);
                  }
                )
              ) 
            )
          ]
        )
      ),
      body: Container(
        color:Colors.black,
        child:Center(
          child: Scannow()
        )
      ),
    );
  }
}

class Scannow extends StatefulWidget {

  @override
  _ScannowState createState() => _ScannowState();
}

class _ScannowState extends State<Scannow> {

  static String text = "";
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
         child: Column(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.center,
           children:<Widget>[
             Container(
               height: MediaQuery.of(context).size.height - 300,
               margin: EdgeInsets.symmetric(horizontal:30),
               child:ListView(
                 scrollDirection: Axis.vertical,
                 children: <Widget>[
                   Card(
                    color:cardColor,
                    child:Text(text,style: TextStyle(color:Colors.black))
                  ),
                  Card(
                    color:cardColor,
                    child:Text(text,style: TextStyle(color:Colors.black))
                  ),
                  Card(
                    color:cardColor,
                    child:Text(text,style: TextStyle(color:Colors.black))
                  ),
                  Card(
                    color:cardColor,
                    child:Text(text,style: TextStyle(color:Colors.black))
                  ),
                  Card(
                    color:cardColor,
                    child:Text(text,style: TextStyle(color:Colors.black))
                  ),
                  Card(
                    color:cardColor,
                    child:Text(text,style: TextStyle(color:Colors.black))
                  ),
                  Card(
                    color:cardColor,
                    child:Text(text,style: TextStyle(color:Colors.black))
                  ),
                  Card(
                    color:cardColor,
                    child:Text(text,style: TextStyle(color:Colors.black))
                  ),
                  Card(
                    color:cardColor,
                    child:Text(text,style: TextStyle(color:Colors.black))
                  ),
                  Card(
                    color:cardColor,
                    child:Text(text,style: TextStyle(color:Colors.black))
                  ),
                  Card(
                    color:cardColor,
                    child:Text(text,style: TextStyle(color:Colors.black))
                  ),
                  Card(
                    color:cardColor,
                    child:Text(text,style: TextStyle(color:Colors.black))
                  ),
                  Card(
                    color:cardColor,
                    child:Text(text,style: TextStyle(color:Colors.black))
                  ),
                  Card(
                    color:cardColor,
                    child:Text(text,style: TextStyle(color:Colors.black))
                  ),
                 ],
               ),
             ),
             Container(height:50),
             RaisedButton(
              color:Colors.deepOrange,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Scan Now",
                    style: TextStyle(
                      color:Colors.white,
                      fontSize:20,
                      fontWeight:FontWeight.bold
                    ),
                  ),
                  Container(width:30,height:55),
                  Icon(
                    Icons.scanner,
                    color: Colors.white,
                  ),
                ],
              ),
              onPressed: () async{
                String qrtext = await scanner.scan();
                setState(() {
                  text=qrtext;
                });
              },
            ),
            Container(height: 20,)
           ]
         ),
       )
    );
  }
}