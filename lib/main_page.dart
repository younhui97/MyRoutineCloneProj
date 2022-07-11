import 'package:contact/rlist.dart';
import "package:flutter/material.dart";
import "package:contact/tabbar.dart";

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>{
  // int _selectedTabIndex = 0;
  @override
  Widget build(BuildContext context){
    var now = DateTime.now();
    List<String> wd = ['월','화','수','목','금','토','일'];
    return MaterialApp(
        theme: ThemeData(fontFamily: 'pr'),
        home: Scaffold(
            body :
            Container(
              height: MediaQuery.of(context).size.height,
              child:
                Expanded(child:
                  Column(
                  children: [
                    SizedBox( height: MediaQuery.of(context).size.height*0.027,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.063,
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('        ${now.year}년 ${now.month}월',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                              IconButton(onPressed: ()=>{} , icon: Icon(Icons.calendar_month_outlined,color: Colors.black87,)),
                            ],
                          ),
                          Row(
                            children:[
                              IconButton(
                                onPressed: ()=>{} ,
                                icon: Icon(Icons.more_horiz,color: Colors.black87,),
                              ),
                              Text("  ")
                            ],
                          ),
                        ],
                      ),
                    ),
                    // 2022년 1월 + 달력
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.1,
                      child: Row(
                        children: [
                          for (int i= 0; i<7; i++)
                            Expanded(child:
                            TextButton(onPressed: (){},
                                child: Column(
                                  children: [
                                    Text(wd[i],style: TextStyle(color: (now.subtract(Duration(days: now.weekday - i-1)).day == now.day) ? Colors.black87 : Colors.black12),),
                                    SizedBox.fromSize(
                                      size: Size(40, 40), // button width and height
                                      child: ClipOval(
                                        child: Material(
                                          color: (now.subtract(Duration(days: now.weekday - i-1)).day == now.day) ? Color(0xFF16cd73) : Color(0xffeceef0), // button color
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text('${now.subtract(Duration(days: now.weekday - i-1)).day}',style: TextStyle(color: Colors.white),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),],)
                            ),)
                        ],
                      ),
                    ), //요일 쭉
                    Container(
                        height: MediaQuery.of(context).size.height*0.01
                    ), //요일 쭉 및 공간
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFDBDBDB), width: 0.5),
                      ),
                    ),
                    Container(
                      child:
                      Container(
                          height: MediaQuery.of(context).size.height*0.72,
                          color: const Color(0xFFEDEDED),
                          child: Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height:MediaQuery.of(context).size.height*0.72,
                                  child: TabbarC(),
                                ),
                              ],
                            ),
                          )
                      ),
                    )
                  ],
                ),)

            ),
            bottomNavigationBar: BottomAppBar (
                elevation: 0,
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 0.5),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.home,
                              color: Color(0xFF3FCD76),),
                            Text("홈",style: TextStyle(color: Color(0xFF3FCD76)),)
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.thumb_up_outlined,
                              color: Colors.black87,),
                            Text("루틴추천")
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.emoji_events_outlined,
                              color: Colors.black87,),
                            Text("성취")
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.people_outlined,
                              color: Colors.black87,),
                            Text("소셜")
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.person_outlined,
                              color: Colors.black87,),
                            Text("내정보")
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                  ],
                )
            )
        )
    );
  }

}


