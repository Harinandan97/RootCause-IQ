import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:root_couse_iq/provider/provider.dart';
import 'package:root_couse_iq/view/Fornt%20page/WelcomeScreen.dart';

import '../../Custom_Widgets/CustomElevetedButton.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final data =Provider.of<RootProvider>(context,listen: false);
    return Scaffold(
      body: SafeArea(child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(width: MediaQuery.of(context).size.width*0.3,
                    height: MediaQuery.of(context).size.height*0.3,
                    child: CircleAvatar(backgroundImage:AssetImage("assets/images/table lady.png") ,)),
                Text(data.userMail.toString()),
              ],
            ),
            Container(width: MediaQuery.of(context).size.width*0.9,
                child: CustomButton(txt: "Logout",clr: Colors.red,OnPressed: (){
                  data.messages.clear();
                  data.Logout();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>WelcomeScreen()));
                },))
          ],

        ),
      )),

    );

  }
}
