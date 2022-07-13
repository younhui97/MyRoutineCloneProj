import 'package:flutter/material.dart';

class Rlist extends StatefulWidget {
  const Rlist({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return RlistState();
  }
}

class RlistState extends State<Rlist>{
  static var listnum = 1 ;
  // bool checksel = false;
  // var checklist = [];
  var checkList = List<bool>.filled(5, false, growable: true);
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
                                    child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: '언제',
                                        )
                                    ),
                                  )
                                // Text("기상 직후",style: TextStyle(),),
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
                                          labelText: '루틴명',
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
                        IconButton(onPressed: ()=>{setState((){checkList[index]=true;checkcnt++;})} ,
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




