import 'package:flutter/material.dart';


class Rlist extends StatelessWidget{
  const Rlist({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.48,
          width: MediaQuery.of(context).size.width*0.98,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 15,
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
                        child: Text("1",style: TextStyle(),),
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
                                child: Text("기상 직후",style: TextStyle(),),),
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
                                child: Text("아침에 물 한잔",style: TextStyle(),),),
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
                      child: Icon(Icons.check),),
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


