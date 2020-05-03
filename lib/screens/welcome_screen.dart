import 'package:flash_chat/components/appButtons.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;
  void initState(){
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
//      upperBound: 70.0,
      vsync: this //what is going to add as a ticker
    );
//    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
//    animation.addStatusListener((status ){
//      if(status == AnimationStatus.completed){ //when forward() animation is used.
//        controller.reverse(from : 1.0);
//      }
//      else if(status == AnimationStatus.dismissed){
//        controller.forward();
//      }
//    });

    animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);
    controller.forward();

    controller.addListener((){
      setState(() {});
//      print(animation.value);
    });

  }
  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag : 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 70.0,
                    ),
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text : ['Flash Chat'],
                  speed: Duration(milliseconds: 400),
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
            AppButton(
                colour:Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                title : 'Login'
            ),

            AppButton(
                colour:Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                title : 'Registor'
            ),
          ],
        ),
      ),
    );
  }
}
