import 'package:flutter/material.dart';
import 'screens/Homepage.dart';
import 'screens/Login.dart';
import 'screens/Welcome.dart';
import 'screens/signup.dart';



void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(

        accentColor: Colors.black,
        dialogBackgroundColor: Colors.black,


//        colorScheme: ColorScheme.dark(),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(),
//        '/HomePage': (context) => CurrentPage(),
        '/Signup': (context) => SignUpPage(),
        '/Login': (context) => LoginPage(),
      },

    );
  }

}
