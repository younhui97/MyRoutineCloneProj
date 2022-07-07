import 'package:contact/rlist.dart';
import "package:flutter/material.dart";
import "package:contact/tabbar.dart";

class MainPage extends StatefulWidget {
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
            Column(
              children: [
                SizedBox(height: 30,),
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
                ), // 2022년 1월 + 달력
                Container(
                    height: 10.0
                ), // 달력 밑 공간
                Row(
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
                ), //요일 쭉
                Container(
                    height: 10.0
                ), //요일 쭉 및 공간
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFDBDBDB), width: 0.5),
                  ),
                ),
                // Container(
                //   color: const Color(0xFFEDEDED),
                //   child:
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Expanded(
                //           child: Tabbar()
                //         )
                //     ],
                //   ),
                // ),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFDBDBDB), width: 0.5),
                  ),
                ),
                Container(
                  color: const Color(0xFFEDEDED),
                  child: Column(
                    children: [
                      Container(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 20,
                          ),
                          Container(
                            height: 40,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: ToggleButtons(
                              isSelected: [true,false],
                              fillColor: Color(0xFFebfcdc),
                              selectedBorderColor: Color(0xff16cd73),
                              onPressed: (d) {},
                              borderRadius: BorderRadius.circular(4.0),
                              // constraints: BoxConstraints(minHeight: 38,minWidth: 60),
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text('일간', style: TextStyle(color:Colors.black54)),
                                ), //일간
                                Container(
                                  alignment: Alignment.center,
                                  child: Text('주간', style: TextStyle(color:Colors.black54)),
                                ), // 주간
                              ],
                            ),
                          ), //일간,주간
                          Container(
                            width: 10,
                          ),
                          Container(
                            width:70,
                            child: OutlinedButton(
                              onPressed: (){},
                              style: OutlinedButton.styleFrom(
                                  fixedSize: const Size(80,40),
                                  backgroundColor: Colors.white
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.schedule_outlined,color: Colors.black54,),
                                  Expanded(child:
                                  Icon(Icons.expand_more,color: Colors.black54,)
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(child:
                          Container(
                            width: 10,
                          )
                          ),
                          Row(children: [
                            TextButton(
                              style: TextButton.styleFrom( primary: Color(0xFF00430F), padding: EdgeInsets.fromLTRB(10,25,8,25), ),
                              onPressed: ()=>{},
                              child: Row(
                                children: [
                                  Icon(Icons.swap_vert,color: Colors.black54,size: 16,),
                                  Text("순서변경",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 13),),
                                ],
                              ),
                            ),
                            Container(
                              width: 5,
                              child: Text("|"),
                            ),
                            TextButton(
                              style: TextButton.styleFrom( primary: Color(0xFF00430F), padding: EdgeInsets.fromLTRB(5,25,10,25), ),
                              onPressed: ()=>{},
                              child: Row(
                                children: [
                                  Icon(Icons.filter_alt_outlined,color: Colors.black54,size: 15,),
                                  Text("필터",style: TextStyle(color: Colors.black54,fontSize: 13, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ],
                          ),
                        ],
                      ),
                      Container(height: 10), // 리스트 위에 빈 공간
                      Column(
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [

                                      Rlist(),//리스트 위에 공간
                                      // Row(
                                      //   children: [
                                      //     Column(
                                      //       children: [
                                      //         SizedBox(
                                      //           width: 30,
                                      //           height: 50,
                                      //           child: Center(
                                      //             child: Text("1",style: TextStyle(),),
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     Column(
                                      //       children: [
                                      //         Container(
                                      //           width: 100,
                                      //           height: 50,
                                      //           decoration: BoxDecoration(
                                      //             border: Border.all(color: Color(0xFFDBDBDB), width: 1),
                                      //             color: Colors.white,
                                      //             borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      //           ),
                                      //           child: Align(
                                      //             alignment: Alignment.centerLeft,
                                      //             child: Text("    기상 직후",style: TextStyle(),),),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     Column(
                                      //       children: [
                                      //         Container(
                                      //           width: MediaQuery.of(context).size.width-210,
                                      //           height: 50,
                                      //           decoration: BoxDecoration(
                                      //             border: Border.all(color: Color(0xFF50e397), width: 2),
                                      //             color: Colors.white,
                                      //             borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      //           ),
                                      //           child: Align(
                                      //             alignment: Alignment.centerLeft,
                                      //             child: Text("    아침에 물 한잔"),),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     Column(
                                      //       children: [
                                      //         Container(
                                      //           width: 50,
                                      //           height: 50,
                                      //           decoration: BoxDecoration(
                                      //             border: Border.all(color: Color(0xFFDBDBDB), width: 1),
                                      //             color: Colors.white,
                                      //             borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      //           ),
                                      //           child: Center(
                                      //             child: Icon(Icons.check),),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ],
                                      // ) // 이걸 반복해야함

                                    ],
                                  ),
                                  Container(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),

                ),
              ],
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
                      height: 20,
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
                      height: 20,
                    ),
                  ],
                )

            )
        )
    );
  }

}
