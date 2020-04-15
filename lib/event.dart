import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:mathrix20/main.dart';

class Event extends StatefulWidget {

  String event;
  Event(this.event);
  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {

  Color themeColor = Colors.deepOrange;
  var pCount=0;
  bool isLoading = true;
  var details="";
  var r={};
  String url = "http://api.mathrix.in/events/";
  String title='';
  var titleArr = {
    'cr':'Code Relay',
    'bs':'Brainstrom',
    'sh':'Sherlock',
    'bc':'Beat the clock',
    'mq':'Math Quiz',
    'th':'Treasure Hunt',
    'su':'Sudoku',
    'cm':'Creative Math',
  };

  _getDetails(u) async{
    final res = await http.get(u);
    if(res.statusCode==200){
      return res.body;
      // return json.decode(res.body);
    }
    return "";
  }

  @override
  void initState(){
    super.initState();
    title = titleArr[widget.event];
    var eventUrl = url+widget.event.toString().toUpperCase()+"/";
     _getDetails(eventUrl).then((result){
        setState(() {
          details=result;
        });
        setState(() {
          isLoading=false;
        });
        setState(() {
          r = jsonDecode(details.toString());
          pCount = r['list'].length;
        });
     });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title:Row(
          children:<Widget>[
            Text(title,style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),
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
          child: isLoading?Center(child: CircularProgressIndicator(
            backgroundColor: Color(0x00000000),
            valueColor: AlwaysStoppedAnimation<Color>(themeColor),
          )):Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.symmetric(horizontal:30,vertical:50),
            child:Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Container(
                    width: 120,
                    height:120,
                    margin: EdgeInsets.only(bottom:20),
                    decoration: BoxDecoration(
                      color:themeColor,
                      shape:BoxShape.circle,
                    ),
                    child:Center(child: Text(pCount.toString(),style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 40))),
                  ),
                  Expanded(child: Center(child: Text("Participants",style:TextStyle(color: themeColor,fontWeight:FontWeight.bold,fontSize:30)),))
                ],
                ),
                Divider(color: themeColor,thickness: 2),
                Container(
                  height: MediaQuery.of(context).size.height - 400,
                  margin: EdgeInsets.symmetric(horizontal:30,vertical:10),
                  child: ListView.builder(
                    itemCount: pCount,
                    itemBuilder: (BuildContext context,int index){
                      var cards = Card(
                        color: Colors.white,
                        child:InkWell(
                          splashColor: Colors.yellow,
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                    title: "Details",
                                    firstLetter:r['list'][index]['student_name'][0].toString(),
                                    description:Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children:<Widget>[
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:MainAxisAlignment.center,
                                          children:<Widget>[
                                            Expanded(child: Container(padding:EdgeInsets.symmetric(horizontal:15),width: 30,child: Text("Name",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.black,),)),),
                                            Expanded(child: Container(child: Text(r['list'][index]['student_name'].toString(),style:TextStyle(color:Colors.black),)),)
                                          ]
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:MainAxisAlignment.center,
                                          children:<Widget>[
                                            Expanded(child: Container(padding:EdgeInsets.symmetric(horizontal:15),width: 30,child: Text("College id",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.black,),)),),
                                            Expanded(child: Container(child: Text(r['list'][index]['college_id'].toString(),style:TextStyle(color:Colors.black),)),)
                                          ]
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:MainAxisAlignment.center,
                                          children:<Widget>[
                                            Expanded(child: Container(padding:EdgeInsets.symmetric(horizontal:15),width: 30,child: Text("College",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.black,),)),),
                                            Expanded(child: Container(child: Text(r['list'][index]['college_name'].toString(),style:TextStyle(color:Colors.black),)),)
                                          ]
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:MainAxisAlignment.center,
                                          children:<Widget>[
                                            Expanded(child: Container(padding:EdgeInsets.symmetric(horizontal:15),width: 30,child: Text("Department",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.black,),)),),
                                            Expanded(child: Container(child: Text(r['list'][index]['department'].toString(),style:TextStyle(color:Colors.black),)),)
                                          ]
                                        ),
                                      ]
                                    ),
                                        
                                    buttonText: "Okay",
                                  ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(height:10),
                              Text(r['list'][index]['mathrix_id'],style:TextStyle(fontWeight:FontWeight.bold)),
                              Container(height:10),
                              Text(r['list'][index]['student_name']),
                              Container(height:10)
                            ],
                          ),
                        ),
                      );
                      return cards;
                    }
                  ),
                ),
              ],
            ),
          )
        )
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String title, buttonText;
  final Widget description;
  final Image image;
  final String firstLetter;

  CustomDialog({
    @required this.title,
    @required this.firstLetter,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Consts.padding),
      ),      
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: 15,
            right: 15,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              description,
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
            backgroundColor: Colors.deepOrange,
            radius: Consts.avatarRadius,
            child: Center(
              child:Text(firstLetter,style:TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize:45))
            ),
          ),
        ),
        //...top circlular image part,
      ],
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
