import 'registration_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flashchat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    // upperBound: 100.0,
    controller.forward();
    animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);

//    animation=CurvedAnimation(parent: controller, curve: Curves.ease);
//    animation.addStatusListener((status) {
//      if(status==AnimationStatus.completed){
//        controller.reverse(from: 1.0);
//      }
//      else if(status==AnimationStatus.dismissed){
//        controller.forward();
//      }
//    });

    controller.addListener(() {
      setState(() {});
    });
    // controller.value
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      //Colors.red.withOpacity(controller.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                    //animation.value,
                    //controller.value,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 400),
                  totalRepeatCount: 3,
                  displayFullTextOnTap: true,
                  pause: Duration(milliseconds: 30),
                  //'${controller.value.toInt()}%',
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'LogIn',
              colour: Colors.lightBlueAccent,
              onPressed: () {
              Navigator.pushNamed(
                  context, LoginScreen.id); //Go to login screen.
            },),
            RoundedButton(
              title: 'Register',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
                //Go to registration screen.
              },
            ),
          ],
        ),
      ),
    );
  }
}

