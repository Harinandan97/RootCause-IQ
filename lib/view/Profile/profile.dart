import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Custom_Widgets/CustomElevetedButton.dart';
void main(){
  runApp(MaterialApp(home: Profile(),));
}
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Center(child: CircleAvatar(backgroundImage:AssetImage("assets/images/table lady.png") ,),),
          Text("USER"),
          Align(alignment:Alignment.bottomCenter,
              child: CustomButton(txt: "Logout",clr: Colors.red,))
        ],

      )),

    );

  }
}
