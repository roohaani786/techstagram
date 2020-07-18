//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:jitsi_meet/jitsi_meet.dart';
//import 'package:jitsi_meet/jitsi_meeting_listener.dart';
//import 'package:quarantine_flutter/Widget/bezierContainer.dart';
//import 'package:quarantine_flutter/Login.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'Widget/customClipper.dart';
//import 'dart:math';
//
//
//class Joinnow extends StatefulWidget {
//  @override
//  _JoinnowState createState() => _JoinnowState();
//}
//
//class _JoinnowState extends State<Joinnow> {
//
//  Widget _backButton() {
//    return InkWell(
//      onTap: () {
//        Navigator.pop(context);
//      },
//      child: Container(
//
//        child: Row(
//          children: <Widget>[
//            Container(
//              color: Colors.green,
//              padding: EdgeInsets.only(left: 12, top: 20, bottom: 10),
//              child: Icon(Icons.keyboard_arrow_left,size: 30.0, color: Colors.white),
//            ),
//
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget _title() {
//    return RichText(
//      textAlign: TextAlign.center,
//      text: TextSpan(
//          text: 'Join',
//          style: GoogleFonts.portLligatSans(
//            textStyle: Theme.of(context).textTheme.headline4,
//            fontSize: 30,
//            fontWeight: FontWeight.w700,
//            color: Color(0xffe46b10),
//          ),
//
//          children: [
//            TextSpan(
//              text: ' Meet',
//              style: TextStyle(color: Colors.white, fontSize: 30),
//            ),
//            TextSpan(
//              text: 'ing',
//              style: TextStyle(color: Colors.cyanAccent, fontSize: 30),
//            ),
//          ]),
//    );
//  }
//
//
//
//  final serverText = TextEditingController();
//  final roomText = TextEditingController();
//  final subjectText = TextEditingController();
//  final nameText = TextEditingController();
//  final emailText = TextEditingController();
//  var isAudioOnly = true;
//  var isAudioMuted = true;
//  var isVideoMuted = true;
//
//  @override
//  void initState() {
//    super.initState();
//    JitsiMeet.addListener(JitsiMeetingListener(
//        onConferenceWillJoin: _onConferenceWillJoin,
//        onConferenceJoined: _onConferenceJoined,
//        onConferenceTerminated: _onConferenceTerminated,
//        onError: _onError));
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    JitsiMeet.removeAllListeners();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Scaffold(
//        backgroundColor: Colors.black,
//
//        body: Container(
//
//
//          padding: const EdgeInsets.symmetric(
//            horizontal: 25.0,
//            vertical: 0.0,
//          ),
//          child: SingleChildScrollView(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//
//                SizedBox(height: 60.0,),
//                _title(),
//
//
//                SizedBox(
//                  height: 24.0,
//                ),
//                TextField(
//                    style: new TextStyle(color: Colors.white),
//                  controller: serverText,
//                  decoration: InputDecoration(
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(
//                          color: Colors.white,
//                        ),
//                        borderRadius: BorderRadius.circular(20.0),
//                      ),
//                      enabled: false,
//
//                    fillColor: Colors.white,
//
//
//
//                      border: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(20),
//                          borderSide: BorderSide(color: Colors.white)),
//                      labelText: "video.offschool.xyz",
//                      labelStyle: TextStyle(
//                        color: Colors.grey.shade500,
//                      ),
//                      hintText: "Hint: Leave empty for meet.jitsi.si",
//                  hintStyle: TextStyle(
//                    color: Colors.blueGrey
//                  ))
//                ),
//                SizedBox(
//                  height: 16.0,
//                ),
//                TextField(
//
//                  controller: roomText,
//                  cursorColor: Colors.orangeAccent,
//
//                  style: TextStyle(color: Colors.orangeAccent),
//                  decoration: InputDecoration(
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(
//                          color: Colors.white,
//                        ),
//                        borderRadius: BorderRadius.circular(20.0),
//                      ),
//                      enabled: true,
//                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
//                    labelText: "Meeting Name",
//                      labelStyle: TextStyle(
//                        color: Colors.grey.shade500,
//                      ),
//                      hintText: "Meeting name or code",
//                      hintStyle: TextStyle(
//                          color: Colors.blueGrey
//                      )
//                  ),
//                ),
//                SizedBox(
//                  height: 16.0,
//                ),
//                TextField(
//                  controller: subjectText,
//                  cursorColor: Colors.orangeAccent,
//                  style: TextStyle(color: Colors.orangeAccent),
//                  decoration: InputDecoration(
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(
//                          color: Colors.white,
//                        ),
//                        borderRadius: BorderRadius.circular(20.0),
//                      ),
//                      enabled: true,
//                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
//                    labelText: "Course Name",
//                      labelStyle: TextStyle(
//                        color: Colors.grey.shade500,
//                      ),
//                      hintText: "Course name or code",
//                      hintStyle: TextStyle(
//                          color: Colors.blueGrey
//                      )
//                  ),
//                ),
//                SizedBox(
//                  height: 16.0,
//                ),
//                TextField(
//                  controller: nameText,
//                  cursorColor: Colors.orangeAccent,
//                  style: TextStyle(color: Colors.orangeAccent),
//                  decoration: InputDecoration(
//
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(
//                          color: Colors.white,
//                        ),
//                        borderRadius: BorderRadius.circular(20.0),
//                      ),
//                      enabled: true,
//
//                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
//                    labelText: "Display Name",
//                      labelStyle: TextStyle(
//                        color: Colors.grey.shade500,
//                      ),
//                      hintText: "Your name or Username",
//                      hintStyle: TextStyle(
//                          color: Colors.blueGrey
//                      )
//                  ),
//                ),
//                SizedBox(
//                  height: 16.0,
//                ),
//                Theme(
//                  data: new ThemeData(
//
//                  ),
//                  child: TextField(
//
//                    controller: emailText,
//                    cursorColor: Colors.orangeAccent,
//                    style: TextStyle(color: Colors.orangeAccent),
//                    decoration: InputDecoration(
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(
//                          color: Colors.white,
//                        ),
//                        borderRadius: BorderRadius.circular(20.0),
//                      ),
//                    enabled: true,
//
//                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
//                      labelText: "Email",
//                      labelStyle: TextStyle(
//                        color: Colors.grey.shade500,
//                      ),
//                        hintText: "Your e-mail address",
//                        hintStyle: TextStyle(
//                            color: Colors.blueGrey
//                        )
//                    ),
//                  ),
//                ),
//                SizedBox(
//                  height: 16.0,
//                ),
//                Container(
//
//                  decoration: BoxDecoration(
//                    color: Colors.green.shade700,
//                    borderRadius: BorderRadius.circular(20.0),
//                  ),
//
//                    child: CheckboxListTile(
//                    title: Text("Audio Only",style: TextStyle(color: Colors.white)),
//                    value: isAudioOnly,
//                    onChanged: _onAudioOnlyChanged,
//                  ),
//                ),
//                SizedBox(
//                  height: 16.0,
//                ),
//                Container(
//                  decoration: BoxDecoration(
//                    color: Colors.pinkAccent.shade200,
//                    borderRadius: BorderRadius.circular(20.0),
//                  ),
//                  child: CheckboxListTile(
//
//
//                    title: Text("Audio Muted",style: TextStyle(color: Colors.white),),
//                    value: isAudioMuted,
//                    onChanged: _onAudioMutedChanged,
//                  ),
//                ),
//                SizedBox(
//                  height: 16.0,
//
//                ),
//                Container(
//                  decoration: BoxDecoration(
//                    color: Colors.grey.shade700,
//                    borderRadius: BorderRadius.circular(20.0),
//                  ),
//                  child: CheckboxListTile(
//                    title: Text("Video Muted",style: TextStyle(color: Colors.white)),
//                    value: isVideoMuted,
//                    onChanged: _onVideoMutedChanged,
//                  ),
//                ),
//                Divider(
//                  height: 48.0,
//                  thickness: 2.0,
//                ),
//                SizedBox(
//                  height: 64.0,
//                  width: double.maxFinite,
//
//                  child: RaisedButton(
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(80)),
//
//
//                    onPressed: () {
//                      _joinMeeting();
//                    },
//                    child: Text(
//                      "Join Meeting",
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    color: Colors.purpleAccent.shade700,
//                  ),
//                ),
//                SizedBox(
//                  height: 48.0,
//                ),
//
//
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//
//  _onAudioOnlyChanged(bool value) {
//    setState(() {
//      isAudioOnly = value;
//    });
//  }
//
//  _onAudioMutedChanged(bool value) {
//    setState(() {
//      isAudioMuted = value;
//    });
//  }
//
//  _onVideoMutedChanged(bool value) {
//    setState(() {
//      isVideoMuted = value;
//    });
//  }
//
//  _joinMeeting() async {
//    String serverUrl =
//    serverText.text?.trim()?.isEmpty ?? "" ? null : serverText.text;
//
//    try {
//      var options = JitsiMeetingOptions()
//        ..room = roomText.text
//        ..serverURL = serverUrl
//        ..subject = subjectText.text
//        ..userDisplayName = nameText.text
//        ..userEmail = emailText.text
//        ..audioOnly = isAudioOnly
//        ..audioMuted = isAudioMuted
//        ..videoMuted = isVideoMuted;
//
//      debugPrint("JitsiMeetingOptions: $options");
//      await JitsiMeet.joinMeeting(options,
//          listener: JitsiMeetingListener(onConferenceWillJoin: ({message}) {
//            debugPrint("${options.room} will join with message: $message");
//          }, onConferenceJoined: ({message}) {
//            debugPrint("${options.room} joined with message: $message");
//          }, onConferenceTerminated: ({message}) {
//            debugPrint("${options.room} terminated with message: $message");
//          }));
//    } catch (error) {
//      debugPrint("error: $error");
//    }
//  }
//
//  void _onConferenceWillJoin({message}) {
//    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
//  }
//
//  void _onConferenceJoined({message}) {
//    debugPrint("_onConferenceJoined broadcasted with message: $message");
//  }
//
//  void _onConferenceTerminated({message}) {
//    debugPrint("_onConferenceTerminated broadcasted with message: $message");
//  }
//
//  _onError(error) {
//    debugPrint("_onError broadcasted: $error");
//  }
//}