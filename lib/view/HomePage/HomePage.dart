import 'package:flutter/material.dart';
import '../CommunicationScreen/Communication.dart';
import '../Profile/profile.dart';
import 'MainPhoto.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 1;

  final List<Widget> pages = const [
    ChatScreen(),
    Photo(),
    Profile(),
  ];

  void onTabChanged(int value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // 🚫 disable back button
      child: Scaffold(
        body: SafeArea(
          child: pages[index],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: onTabChanged, // ✅ callback reference
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'ASK IT',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "HOME",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "PROFILE",
            ),
          ],
        ),
      ),
    );
  }
}
