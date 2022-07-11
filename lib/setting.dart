import 'package:flutter/material.dart';
import 'main_page.dart';


void main() => runApp(Setting());

class Setting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),),
        side: BorderSide(width: 1, color: Color(0XFFB1B6BB)),
        elevation: 0,
        primary: Colors.white,
        onPrimary: Colors.black54,
        padding: EdgeInsets.all(20),
        textStyle: const TextStyle(fontSize: 15));
    return MaterialApp( //use MaterialApp() widget like this
        home: Scaffold (
          appBar: PreferredSize(
              preferredSize: Size(0,80),
              child: Padding(
                padding: EdgeInsets.only(top:30),
                child: AppBar(
                  centerTitle: true,
                  elevation: 1,
                  backgroundColor: Color(0xFFFFFFFF),
                  title: Text('설정',style: TextStyle(color: Colors.black),),
                  toolbarHeight: 80,
                  leading:
                  IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
                      onPressed: ()=>{
                        Navigator.push(context, MaterialPageRoute(builder: (_) => MainPage()))
                      }),
                ),
              )
          ),
          body: Container(
            child: Column(
              children: [
                Container(
                  height: 45,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: ()=>{},
                      style: style,
                      child: Row(children:[
                        Icon(Icons.insert_photo_outlined, size: 18),
                        Text(" 내 루틴 공유")
                      ])
                  ),
                ),
                Container(
                  height: 45,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: ()=>{},
                      style: style,
                      child: Row(children:[
                        Icon(Icons.nightlight_outlined, size: 18),
                        Text(" 쉬고 있는 루틴")
                      ])
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: ()=>{},
                      style: style,
                      child: Row(children:[
                        Icon(Icons.hotel_outlined, size: 18),
                        Text(" 전체 휴식")
                      ])
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 30,
                  child: Text("   원하는 기간 동안 루틴 실천을 일시정지할 수 있어요",style: TextStyle(fontSize: 10,color: Colors.black38)),
                ),
                Container(
                  height: 45,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: ()=>{},
                      style: style,
                      child: Row(children:[
                        Icon(Icons.restart_alt, size: 18),
                        Text(" 기록 초기화")
                      ])
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 30,
                  child: Text("   루틴, 신호등, 회고 기록을 초기화 할 수 있어요",style: TextStyle(fontSize: 10,color: Colors.black38)),
                ),
              ],
            ),
          ),

        )//create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}
//MediaQuery.of(context).size.height*0.063
//height: MediaQuery.of(context).size.height*0.027


