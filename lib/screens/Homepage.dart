import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'fetchuser.dart';


class CurrentPage extends StatefulWidget {

  final String emaildata;

  CurrentPage({Key key, @required this.emaildata}) : super(key: key);

  @override
  _CurrentPageState createState() => _CurrentPageState(emaildata: emaildata);
}

class _CurrentPageState extends State<CurrentPage> {


  final String emaildata;

  _CurrentPageState({Key key, @required this.emaildata});

  logout(BuildContext context) {
    Navigator.pop(context);
  }




  @override
  Widget build(BuildContext context) {
//    final height = MediaQuery.of(context).size.height;
    // TODO: implement build

    return Scaffold(
      body: fetchUser(emaildata: emaildata),
    );
  }
}
