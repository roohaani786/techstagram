import 'package:flutter/material.dart';
import 'package:techstagram/screens/Homepage.dart';
import 'package:techstagram/screens/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:techstagram/Widget/bezierContainer.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool visible = false;


  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future userLogin() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String emaildata = emailController.text;
    String password = passwordController.text;

    // SERVER API URL
    var url = 'https://chauvinistic-alcoho.000webhostapp.com/login_user.php';

    // Store all data with Param Name.
    var data = {'email': emaildata, 'password': password};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (message == 'Login Matched') {
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Navigate to Profile Screen & Sending Email to Next Screen.
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CurrentPage(emaildata: emailController.text)),
//          CurrentPage(email: emailController.text))
//          email : emailController.text, use this inside  to pass email.
      );
    } else {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Showing Alert Dialog with Response JSON Message.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message, style:
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
                child: Icon(
                    Icons.arrow_back_ios, size: 20.0, color: Colors.white),
              ),

            ],
          ),
        ),
      );
    }

//  Widget _entryField(String title, {bool isPassword = false}) {
//    return Container(
//
//      margin: EdgeInsets.symmetric(vertical: 10),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Text(
//            title,
//            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          TextField(
//              obscureText: isPassword,
//              decoration: InputDecoration(
//                  border: InputBorder.none,
//                  fillColor: Color(0xfff3f3f4),
//                  filled: true))
//        ],
//      ),
//    );
//  }

    Widget _submitButton() {
      return GestureDetector(
          onTap: (){
            // Navigate to the second screen
            userLogin();
          },

      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade200,
//                offset: Offset(2, 2),
            )
          ],
//          gradient: LinearGradient(
//              begin: Alignment.centerLeft,
//              end: Alignment.centerRight,
//              colors: [Color(0xfffbb448), Color(0xfff7892b)])
          color: Colors.deepPurple,
        ),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      );
    }

    Widget _divider() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: Colors.lightGreenAccent,
                  thickness: 1,
                ),
              ),
            ),
            Text('OR', style:
            TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: Colors.lightGreenAccent,
                  thickness: 1,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      );
    }

    Widget _facebookButton() {
      return Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff1959a9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('f',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,

                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Log in with Facebook',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      );
    }

    Widget _createAccountLabel() {
      return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpPage()));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          padding: EdgeInsets.all(15),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Don\'t have an account ?',
                style: TextStyle(fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the second screen
                  Navigator.pushNamed(context, '/Signup');
                },
                child: Text(
                  'Register',
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
            text: 'L',
            style: GoogleFonts.portLligatSans(
              textStyle: Theme
                  .of(context)
                  .textTheme
                  .headline4,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.deepOrangeAccent,
            ),
            children: [
              TextSpan(
                text: 'og',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              TextSpan(
                text: 'in',
                style: TextStyle(color: Colors.cyan.shade500, fontSize: 30),
              ),
            ]),
      );
    }

    Widget _emailPasswordWidget() {
      return Column(
        children: <Widget>[
//        _entryField("Email id"),
//        _entryField("Password", isPassword: true),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
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
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
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
      final height = MediaQuery
          .of(context)
          .size
          .height;
      return Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            height: height,
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: -height * .15,
                    right: -MediaQuery
                        .of(context)
                        .size
                        .width * .4,
                    child: BezierContainer()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .2),
                        _title(),
                        SizedBox(height: 50),
                        _emailPasswordWidget(),
                        SizedBox(height: 20),
                        _submitButton(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.centerRight,
                          child: Text('Forgot Password ?',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ),
                        _divider(),
                        _facebookButton(),
                        SizedBox(height: height * .055),
                        _createAccountLabel(),
                      ],
                    ),
                  ),
                ),
                Positioned(top: 40, left: 0, child: _backButton()),
              ],
            ),
          ));
    }


}