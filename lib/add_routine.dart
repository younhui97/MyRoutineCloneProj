import 'package:contact/rlist.dart';
import 'package:flutter/material.dart';
import 'main_page.dart';


class AddRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return AddRouteState();
  }
}

class AddRouteState extends State<AddRoute> {
  var routinename;
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size(0,80),
                child: Padding(
                  padding: EdgeInsets.only(top:30),
                  child: AppBar(
                    centerTitle: true,
                    elevation: 1,
                    backgroundColor: Color(0xFFFFFFFF),
                    title: Text('루틴 추가하기',style: TextStyle(color: Colors.black),),
                    toolbarHeight: 80,
                    leading:
                    IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
                        onPressed: ()=>{
                          Navigator.of(context).pop(context)
                        }),
                  ),
                )
            ),
            body: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder:(BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(0xFFDCDCDC), width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: Column(
                      children: [
                        Container(height: MediaQuery.of(context).size.height * 0.03,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.65,
                                height: MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xFFDCDCDC), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: Row(
                                    children: [
                                      Container(
                                        width: 10,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.45,
                                            child: TextField(
                                                onChanged: (text){setState((){
                                                  routinename = text;
                                                });},
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: '루틴 이름',
                                                )
                                            ),
                                          )
                                        // Text("아침에 물 한잔",style: TextStyle(),),
                                      ),
                                    ]
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.12,
                                height: MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xFFDCDCDC), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width * 0.1,
                                    child: Text("✔️"),
                                ),
                              ),
                            ]
                        ),
                        Container(height: MediaQuery.of(context).size.height * 0.03,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.77,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xFFDCDCDC), width: 2),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Row(
                              children: [
                                Container(
                                  width: 10,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      child: TextField(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '언제 할래요?',
                                          )
                                      ),
                                    )
                                  // Text("아침에 물 한잔",style: TextStyle(),),
                                ),
                              ]
                          ),
                        ),
                        Container(height: MediaQuery.of(context).size.height * 0.03,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.77,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: Color(0XFF23DE80),
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: TextButton(
                              onPressed: ()=>{
                                RlistState.routineList[RlistState.listnum]=routinename,
                                Navigator.of(context).pop(context)
                              },
                            child: Text("시작하기",style: TextStyle(color: Colors.white),),
                            
                          )
                        ),
                      ],
                    ),
                  );
                }
            )
        )
    );
  }
}


// RlistState.listnum++;
// setState((){});