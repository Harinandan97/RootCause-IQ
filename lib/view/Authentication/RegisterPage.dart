import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:root_couse_iq/Custom_Widgets/CustomElevetedButton.dart';

import '../../Custom_Widgets/TextFormfield.dart';


void main(){
  runApp(MaterialApp(home: Register(),debugShowCheckedModeBanner: false,));
}
class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar:
    AppBar(backgroundColor:Colors.white, automaticallyImplyLeading: true,title: Text("Begin Your Wellness Journey",
      style: TextStyle(fontSize: 18,color: Colors.grey),)
      ,)
      ,body:
   SingleChildScrollView(child:  Container(color: Colors.white,
     child:
     Column(
       children: [
         Align(alignment: .center,
           child: Container(width: MediaQuery.of(context).size.width*0.6,
             child:Image.asset("assets/images/table lady.png") ,
           ),
         ),
         SizedBox(height: 25,),
         Container(
             width: MediaQuery.of(context).size.width*0.9,
             child: CustomTextField(Label: "Gmail",)),
         SizedBox(height: 25,),
         Text("Healing Starts when clarity begins ",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w800,fontSize: 16),),
         SizedBox(height: 35,),
         Container(
             width: MediaQuery.of(context).size.width*0.9,
             child: CustomTextField(Label: "Password",)),
         SizedBox(height: 100,),
         Container(width: MediaQuery.of(context).size.width*0.9,child:  CustomButton(txt: "Register") ,)



       ],
     ),
   ),)
      )



    );
  }
}
