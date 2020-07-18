import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:techstagram/screens/User.dart';

class Album {
  String id;
  String username;
  String email;

  Album({this.id, this.username, this.email});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
    );
  }
}

class fetchUser extends StatefulWidget {

  //Declare variables here
  final String emaildata;


  //fetchUser constructor
  fetchUser({Key key, @required this.emaildata});


  @override
  _fetchUserState createState() => _fetchUserState(emaildata: emaildata);

}



class _fetchUserState extends State<fetchUser> {


  //Declare variables here
  final String emaildata;
  bool halua = false;

  //fetchUser constructor
  _fetchUserState({Key key, @required this.emaildata});

  Future<Album> _futureAlbum;





  //Function to fetch User details
  Future<Album> createAlbum(String emaildata) async {

    var data = jsonEncode(emaildata);
    final http.Response response = await http.post(
      'https://chauvinistic-alcoho.000webhostapp.com/fetch_user.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': data,
      }),
    );

    if (response.statusCode == 201) {
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Create Data'),
            onPressed: () {
              setState(() {
                _futureAlbum = createAlbum(emaildata);
                halua = true;
              });
            },
          ),
          (halua = true)?Container(
            child: FutureBuilder<Album>(
                future: _futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.email);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return CircularProgressIndicator();
                },
              ),
          ):Container(child: Text("Wait",style:
    TextStyle(color: Colors.white),),)


        ],
      ),

    );
  }
}



