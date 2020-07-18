import 'package:flutter/material.dart';



class Welcome extends StatelessWidget {
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
          Text('OR',style:
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

//  final VoidCallback tappu;
//  Onboard({
//    Key key,
//    this.tappu,
//  }) : super(key: key);


  @override
  Widget build(BuildContext context) {


      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text("WELCOME",style:
              TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
//            title: Text("Welcome"),
            actions: <Widget>[

              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Icon(Icons.help_outline,
                color: Colors.lightGreenAccent,),),

            ],
          ),
          backgroundColor: Colors.black,
          body: Container(

            child: Column(
mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(left: 30.0,top: 20.0),
                  child: new Image.asset("lib/assets/images/q.png"),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0,top: 80.0,right: 10.0),
                  child: Text("An e-learning initiative to provide tech / non-tech knowledge at an affordable price. Let's learn together.",textAlign: TextAlign.center,maxLines: 3,style:
                  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,

                  ),),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 25.0),


                  child: Column(
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(

//                          onTap: () { Navigator.push(context, Userlogin()); },
                          child: GestureDetector(

                            onTap: (){
                              // Navigate to the second screen
                              Navigator.pushNamed(context, '/Login');
                            },
                            child: Container(

                              width: 200.0,
                              height: 50.0,



                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Align(
                                  alignment: Alignment.center,



                                      child: Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),


                            ),
                          ),
                        ),
                      ),

                      _divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: GestureDetector(
                          onTap: (){
                            // Navigate to the second screen
                            Navigator.pushNamed(context, '/Signup');
                          },
                          child: Container(

                            width: 200.0,
                            height: 50.0,



                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Align(
                                alignment: Alignment.center,


                                    child: Text("SIGNUP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),


                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ],
            ),
          ),
      );
  }
}