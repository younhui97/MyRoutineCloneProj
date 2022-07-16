import 'package:flutter/material.dart';
import 'package:contact/main_page.dart';

class Rlist extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return RlistState();
  }
}

class RlistState extends State<Rlist>{

  static var listnum = 1 ;
  // static var Rnum=0;
  // bool checksel = false;
  // var checklist = [];
  var checkList = List<bool>.filled(5, false, growable: true);
  static var routineList = List<String>.filled(5,' ', growable: true);
  var checkcnt = 0;
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.53,
          width: MediaQuery.of(context).size.width*0.98,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: listnum,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child:
                    SizedBox(
                      width: 30,
                      height: MediaQuery.of(context).size.height*0.06,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child:
                    SizedBox(
                      width: 30,
                      height: MediaQuery.of(context).size.height*0.06,
                      child: Center(
                        child: Text((index+1).toString(),style: TextStyle(),),
                      ),
                    ),
                  ), //숫자1
                  Expanded(
                    flex:6,
                    child:
                    Container(
                        width: 100, height: MediaQuery.of(context).size.height*0.06,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFDBDBDB), width: 1),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Row(
                            children:[
                              Container(
                                width: 10,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.14,
                                    child: Text(routineList[listnum],style: TextStyle(),),
                                    // TextField(
                                    //     decoration: InputDecoration(
                                    //       border: InputBorder.none,
                                    //       hintText: '언제',
                                    //     )
                                    // ),
                                  )
                              ),
                            ]
                        )
                    ),
                  ), //첫칸
                  Expanded(
                    flex: 16,
                    child:
                    Container(
                      // width: MediaQuery.of(context).size.width-210,
                        height: MediaQuery.of(context).size.height*0.06,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF50e397), width: 2),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Row(
                            children:[
                              Container(
                                width: 10,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.45,
                                    child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '루틴명',
                                        )
                                    ),
                                  )
                                // Text("아침에 물 한잔",style: TextStyle(),),
                              ),
                            ]
                        )
                    ),
                  ), //둘째칸
                  Expanded(
                    flex: 4,
                    child:
                    Container(
                      width: 50, height: MediaQuery.of(context).size.height*0.06,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFDBDBDB), width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Center(
                        child:
                        IconButton(onPressed: ()=>{setState((){
                          if (checkList[index]==true){
                            checkList[index]=false;
                            checkcnt--;}
                          else{
                            checkList[index]=true;
                            checkcnt++;}
                          if((checkcnt==1)&&(listnum==1)){
                            MainPageState.accper=1;
                            setState((){});
                          }
                          if ((checkcnt/listnum)>0.5){
                            MainPageState.accper=0.5;
                          }
                          // MainPage.setState();
                        })},
                            icon: Icon(Icons.check,color: checkList[index] ? Colors.black : Colors.white)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child:
                    SizedBox(
                      width: 30,
                      height: MediaQuery.of(context).size.height*0.06,
                    ),
                  ), //넷째칸
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}




