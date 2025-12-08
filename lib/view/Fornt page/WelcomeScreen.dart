import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:root_couse_iq/view/Authentication/LoginScreen.dart';
void main(){
  runApp(MaterialApp(home: WelcomeScreen(),debugShowCheckedModeBanner: false,));
}
class WelcomeScreen extends StatelessWidget {

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(children: [
        Align(alignment: .bottomCenter,
          child: Container(width: MediaQuery.of(context).size.width*0.85,
          height: MediaQuery.of(context).size.height*0.5,
            child: Image.asset("assets/images/Round main img.png") ,),),
        Text("RootCause IQ",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,fontFamily: "Montserrat"),),
        SizedBox(height: 25,),
        Text("From Symptoms To Clarity Understand \n What Really Affecting Your Wll-being",
          style: TextStyle(color: Colors.grey[402],fontSize: 15,fontWeight: FontWeight.w400,fontFamily: "Montserrat"),),
        SizedBox(height: 150,),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Align(alignment: .bottomRight,
            child: ElevatedButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (_)=>const Loginscreen()));},
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: Color(0xFF89A9AB),
                elevation: 0, // no shadow
                padding: EdgeInsets.all(13)
              ),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size:38,
              ),
            ),
          ),
        ),
      ],),
    ));
  }
}
