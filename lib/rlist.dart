import 'package:flutter/material.dart';

class Rlist extends StatelessWidget{
  const Rlist({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text("hi"),
    // );
    return Column(
      children: [
        SizedBox(
          height: 400,
          width: 400,
          child: ListView.builder(
            shrinkWrap: true,
            // scrollDirection: Axis.horizontal,
            itemCount: 9,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 30,
                        height: 50,
                        child: Center(
                          child: Text("1",style: TextStyle(),),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFDBDBDB), width: 1),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("    기상 직후",style: TextStyle(),),),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width-210,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF50e397), width: 2),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("    아침에 물 한잔"),),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFDBDBDB), width: 1),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Center(
                          child: Icon(Icons.check),),
                      ),
                    ],
                  ),
                ],
              );
            },
          )
          ,
        )
      ],
    );
  }
}


