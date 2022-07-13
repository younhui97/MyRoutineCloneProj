import 'package:contact/myinfo.dart';
import 'package:contact/social.dart';
import "package:flutter/material.dart";
import "package:contact/tabbar.dart";
import 'package:contact/setting.dart';
import 'package:contact/routine_recommend';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unicorndial/unicorndial.dart';
import 'accomplish.dart';
import 'package:contact/rlist.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>{
  final ButtonStyle bottomstyle =
  ElevatedButton.styleFrom(
      elevation: 0,
      primary: Colors.white,
      onPrimary: Colors.black54,
      textStyle: const TextStyle(fontSize: 15));
  @override
  Widget build(BuildContext context){
    void showDatePickerPop() {
      Future<DateTime?> selectedDate = showDatePicker(
        context: context,
        initialDate: DateTime.now(), //초기값
        firstDate: DateTime(2020), //시작일
        lastDate: DateTime.now(), //마지막일
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(), //다크 테마
            child: child!,
          );
        },
      );

      selectedDate.then((dateTime) {
        // Fluttertoast.showToast(
        //   msg: dateTime.toString(),
        //   toastLength: Toast.LENGTH_LONG,
        //   //gravity: ToastGravity.CENTER,  //위치(default 는 아래)
        // );
      });
    }
    var now = DateTime.now();
    List<String> wd = ['월','화','수','목','금','토','일'];
    var childButtons = <UnicornButton>[];
    childButtons.add(
        UnicornButton(
            hasLabel: true,
            labelText: "투두 추가",
            labelHasShadow: false,
            labelBackgroundColor: Colors.transparent,
            currentButton: FloatingActionButton(
              heroTag: "투두 추가",
              backgroundColor: Colors.white,
              child: Icon(Icons.check_box_outlined,color: Colors.black45),
              onPressed: (){},
            )
        )
    );
    childButtons.add(
        UnicornButton(
            hasLabel: true,
            labelText: "루틴 추가",
            labelHasShadow: false,
            labelBackgroundColor: Colors.transparent,
            currentButton: FloatingActionButton(
              heroTag: "루틴 추가",
              backgroundColor: Color(0XFFD6FFAD),
              child: Icon(Icons.add,color: Colors.black45),
              onPressed: () {
                RlistState.listnum++;
                setState((){});
              },
            )
        )
    );
    return MaterialApp(
      theme: ThemeData(fontFamily: 'pr'),
      home: Scaffold(
          body :
          Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
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
                                IconButton(
                                    onPressed: ()=>{
                                      showDatePickerPop()
                                    } , icon: Icon(Icons.calendar_month_outlined,color: Colors.black87,)
                                ),
                              ],
                            ),
                            Row(
                              children:[
                                IconButton(
                                  onPressed: (){
                                    Navigator.of(context).push(_settingRoute());
                                  },
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
                            Container(
                              width: 2,
                            ),
                            for (int i= 0; i<7; i++)
                              Expanded(child:
                              TextButton(onPressed: (){},
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all((now.subtract(Duration(days: now.weekday - i-1)).day == now.day) ? Color(0xFF63686B) : Colors.white),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                          )
                                      )
                                  ),
                                  child: Column(
                                    children: [
                                      Text(wd[i],style: TextStyle(color: (now.subtract(Duration(days: now.weekday - i-1)).day == now.day) ? Colors.white : Colors.black12),),
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
                              ),),
                            Container(
                              width: 2,
                            ),
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
                  );
                },
              )
          ),
          bottomNavigationBar: BottomAppBar (
              elevation: 0,
              color: Colors.white,
              child: Container(
                height: MediaQuery.of(context).size.height*0.077723,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 0.5),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.011282,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*0.05138,
                          child: ElevatedButton(
                            onPressed: ()=>{Navigator.of(context).push(_mainRoute())},
                            style: bottomstyle,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.home,
                                  color: Color(0xFF3FCD76),),
                                Expanded(flex: 1,child: Text("홈",style: TextStyle(color: Color(0xFF3FCD76),fontSize: 11),))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height*0.05138,
                          child: ElevatedButton(
                            onPressed: ()=>{Navigator.of(context).push(_recRoute())},
                            style: bottomstyle,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.thumb_up_outlined,
                                  color: Colors.black87,),
                                Expanded(flex: 1,child: Text("루틴추천",style: TextStyle(color: Colors.black87,fontSize: 11),))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height*0.05138,
                          child: ElevatedButton(
                            onPressed: ()=>{Navigator.of(context).push(_accRoute())},
                            style: bottomstyle,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.emoji_events_outlined,
                                  color: Colors.black87,),
                                Expanded(flex: 1,child: Text("성취",style: TextStyle(color: Colors.black87,fontSize: 11),))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height*0.05138,
                          child: ElevatedButton(
                            onPressed: ()=>{Navigator.of(context).push(_socialRoute())},
                            style: bottomstyle,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.people_outlined,
                                  color: Colors.black87,),
                                Expanded(flex: 1,child: Text("소셜",style: TextStyle(color: Colors.black87,fontSize: 11),))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height*0.05138,
                          child: ElevatedButton(
                            onPressed: ()=>{Navigator.of(context).push(_myinfoRoute())},
                            style: bottomstyle,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.person_outlined,
                                  color: Colors.black87,),
                                Expanded(flex: 1,child: Text("내정보",style: TextStyle(color: Colors.black87,fontSize: 11),))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.011282,
                    ),
                  ],
                ),
              )
          ),
          floatingActionButton: UnicornDialer(
              orientation: UnicornOrientation.VERTICAL,
              parentButtonBackground: Color(0xFF16cd73),
              parentButton: Icon(Icons.add,color: Colors.green,),
              childButtons: childButtons
          )
        // FloatingActionButton(
        //   backgroundColor: Color(0xFF16cd73),
        //   child: Icon(Icons.add,color: Color(0xFF006331)),
        //   onPressed: (){
        //     RlistState.listnum++;
        //   },
        // ),
      ),
    );
  }
}
Route _mainRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MainPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
Route _settingRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Setting(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
Route _recRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Rec(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
Route _accRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Acc(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
Route _socialRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Social(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
Route _myinfoRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Myinfo(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}


