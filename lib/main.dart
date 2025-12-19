import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:root_couse_iq/provider/provider.dart';
import 'package:root_couse_iq/view/Fornt%20page/WelcomeScreen.dart';
import 'package:root_couse_iq/view/HomePage/HomePage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (_) {
        final provider = RootProvider();
        provider.loadLogin();
        return provider;
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RootProvider>(
      builder: (context, provider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          home: provider.user != null
              ? const Home()
              : const WelcomeScreen(),
        );
      },
    );
  }
}
