import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:techstagram/Widget/bezierContainer.dart';
import 'package:techstagram/screens/Login.dart';
import 'package:google_fonts/google_fonts.dart';


class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}



class _SignUpPageState extends State<SignUpPage> {


  bool visible = false;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  Future userRegistration() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    // SERVER API URL
    var url = 'https://chauvinistic-alcoho.000webhostapp.com/register_user.php';

    // Store all data with Param Name.
    var data = {'username': username, 'email': email, 'password' : password};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if(response.statusCode == 200){
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message,style:
            TextStyle(color: Colors.white),),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

  }


  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(

        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 12, top: 20, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left,size: 30.0, color: Colors.white),
            ),

          ],
        ),
      ),
    );
  }


  Widget _submitButton() {
    //testing
    return GestureDetector(
      onTap: (){
        // Navigate to the second screen
        userRegistration();
      },

      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.white70,
                  blurRadius: 0,
              )
            ],

        color: Colors.deepPurple,
               ),
        child: Text(
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }


  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: (){
                // Navigate to the second screen
                Navigator.pushNamed(context, '/Login');
              },
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.cyan.shade500,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'S',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.deepOrangeAccent,
          ),
          children: [
            TextSpan(
              text: 'ig',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextSpan(
              text: 'nup',
              style: TextStyle(color: Colors.cyan.shade500, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[

        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                            Text("username or phone number",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),
                                 ),
        SizedBox(
          height: 10,
        ),
        TextField(

        controller: usernameController,
        decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Color(0xfff3f3f4),
        filled: true),)
        ],
        ),
        ),


        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(

                controller: emailController,
                decoration: InputDecoration(


                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true),)
            ],
          ),
        ),


        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                autocorrect: true,
                controller: passwordController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true),)
            ],
          ),
        ),




      ],
    );
  }


  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,

                    ),
                    _submitButton(),
                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}


