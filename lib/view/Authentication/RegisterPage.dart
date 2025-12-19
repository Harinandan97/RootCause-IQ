import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:root_couse_iq/Custom_Widgets/CustomElevetedButton.dart';
import 'package:root_couse_iq/view/Authentication/LoginScreen.dart';

import '../../Custom_Widgets/TextFormfield.dart';
import '../../provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Register(),
    );
  }
}


class Register extends StatefulWidget {
  const Register({super.key});


  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();

  @override
  Widget build(BuildContext context) {

    final data=Provider.of<RootProvider>(context,listen: false);

    return   Scaffold(
        resizeToAvoidBottomInset: true,
        appBar:
        AppBar(backgroundColor:Colors.white,
          automaticallyImplyLeading: true,title: Text("Begin Your Wellness Journey",
          style: TextStyle(fontSize: 18,color: Colors.grey),)
          ,)
        ,body:SafeArea(child:  SingleChildScrollView(child:  Container(color: Colors.white,
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
              child: CustomTextField(Label: "Email",controller: email,)),
          SizedBox(height: 25,),
          Text("Healing Starts when clarity begins ",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w800,fontSize: 16),),
          SizedBox(height: 35,),
          Container(
              width: MediaQuery.of(context).size.width*0.9,
              child: CustomTextField(Label: "Password",controller: password,)),
          SizedBox(height: 100,),
          Container(width: MediaQuery.of(context).size.width*0.9,child:  CustomButton(txt: "Register",OnPressed: ()async{
            // setState(() {
            //
            // });
            try{
              await data.Register(email.text.trim(), password.text.trim());
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Loginscreen()));
            }
                catch(e){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }

          },),)



        ],
      ),
    ),))

    )




    ;
  }
}
