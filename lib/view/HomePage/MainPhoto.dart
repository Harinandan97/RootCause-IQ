import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Photo(),));
}
class Photo extends StatelessWidget {
  const Photo({super.key});

  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
          body:
              SafeArea(child:
          Center(
            child: Container(width:MediaQuery.of(context).size.width*0.8,height:MediaQuery.of(context).size.height*0.5,
              child: Image.asset("assets/images/main img.png"),),
          )

      ));

  }
}
