import 'package:flutter/material.dart';
import 'main_page.dart';


void main() => runApp(Acc());

class Acc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body:Column(
                children:[
                  Container(
                      height: 100
                  ),
                  Row(
                    children:[
                      IconButton(
                        onPressed: (){
                          Navigator.of(context).pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios,color: Colors.black87,),
                      ),
                      Text("  ")
                    ],
                  ),
                ]
            )

        )
    );
  }
}