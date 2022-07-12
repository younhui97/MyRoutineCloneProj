import 'package:flutter/material.dart';
import 'package:contact/tabbar.dart';
import 'package:contact/rlist.dart';

class RoutineC extends StatelessWidget{
  const RoutineC({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
          child:Container(
          height: MediaQuery.of(context).size.height*0.72,
          color: const Color(0xFFEDEDED),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height:MediaQuery.of(context).size.height*0.2,
                child: TabbarC(),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.01,),
              Container(
                height: MediaQuery.of(context).size.height*0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.06,
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
                      height: MediaQuery.of(context).size.height*0.06,
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
                    Container(
                      width: 10,
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
              ),
              Container(height: MediaQuery.of(context).size.height*0.01), // 리스트 위에 빈 공간
              Column(
                mainAxisSize: MainAxisSize.min,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              Rlist(),
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
        ),
      ),
    );
  }
}