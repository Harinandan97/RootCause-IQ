import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:root_couse_iq/provider/provider.dart';
import 'package:root_couse_iq/view/Authentication/RegisterPage.dart';

import '../../Custom_Widgets/CustomElevetedButton.dart';
import '../../Custom_Widgets/TextFormfield.dart';
import '../Fornt page/WelcomeScreen.dart';
import '../HomePage/HomePage.dart';
import '../Profile/profile.dart';
void main(){
  runApp(MaterialApp(home: Loginscreen(),debugShowCheckedModeBanner: false,));
}
class Loginscreen extends StatefulWidget {

  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
final data =Provider.of<RootProvider>(context,listen: false);
    return Scaffold(resizeToAvoidBottomInset: true,
        body:
       SafeArea(child:  Container(color: Colors.white,child:
       Column(children: [
         Padding(
           padding: const EdgeInsets.only(top: 25,left: 8),
           child: Align(
               alignment: .topLeft,
               child: Text("LoginAccount",style:
               TextStyle(fontSize: 24,fontWeight: FontWeight.w700,fontFamily: "Montserrat"),)),
         ),
         SizedBox(height: 100,),


         Center(
           child: Container(width:MediaQuery.of(context).size.width*0.9,

             child:  CustomTextField(Label: "Email",controller: email,),
           ),
         ),

         SizedBox(height: 80,),
         Center(
           child: Container(width:MediaQuery.of(context).size.width*0.9,

             child:  CustomTextField(Label: "Password",controller: password,),
           ),
         ),
         SizedBox(height: 100,),
         SizedBox(width: MediaQuery.of(context).size.width*0.9,
           child: CustomButton(txt: 'Login',OnPressed: ()async {

             try{
               await data.Login(email.text.trim(), password.text.trim());
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Home()));
             }catch(e){
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
             }

           },) ,
         ),SizedBox(height: 100,)
         ,Row(children: [
           Expanded(child: SizedBox(child:Divider(thickness: 3,color: Colors.grey,) ,))
           ,Padding(
             padding: const EdgeInsets.only(left: 8.0,right: 8),
             child: Text("Not Register Yet?"),
           ),
           Expanded(child: SizedBox(child:Divider(thickness: 3,color: Colors.grey,) ,))],),
         SizedBox(height: 70,),
         Padding(
           padding: const EdgeInsets.only(bottom: 8.0),
           child: Align(alignment: .bottomLeft,
               child: TextButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>Register()));
               }, child: Text("Create An Account ",style: TextStyle(color: Colors.deepOrange),))),
         )


       ],),))

    );

  }
}
