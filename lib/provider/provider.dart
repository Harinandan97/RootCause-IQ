import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../service/RootService.dart';



class RootProvider extends ChangeNotifier {
  final service = RootService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  User? get user => _user;

  // Chat messages list
  final List<ChatMessage> messages = [];

  String? userMail;

  RootProvider() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  // GPT call
  Future<void> gpt(BuildContext context, String prompt) async {
    // Add user message first


    messages.insert(0,ChatMessage(text: prompt, isUser: true));
    notifyListeners();

    final result = await service.providerService(prompt: prompt);

    result.fold(
      (l) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l.message.toString())));
      },
      (r) {
        // Add GPT/server response
        messages.insert(0, ChatMessage(text: r.toString(), isUser: false));
        notifyListeners();
      },
    );
  }


  Future<void> Register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;
      await _saveLogin(email); //sh
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Registration Failed';
    }
  }

  Future<void> Login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      userMail = email;

      await _saveLogin(email); //sh
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Login failed';
    }
  }

  Future<void> Logout() async {
    await _auth.signOut();
    await _clearLogin();
    _user = null;
    notifyListeners();
  }

  Future<void> _saveLogin(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('email', email);
  }

  Future<void> _clearLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> loadLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      userMail = prefs.getString('email');
      notifyListeners();
    }
  }
}
class ChatMessage {
  final String text;
  final bool isUser; // true = user, false = GPT

  ChatMessage({required this.text, required this.isUser});
}