import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:portfolio/responsive_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  List<Widget> navButtons() => [
        NavButton(
          text: "about",
          onPressed: () {
            html.window.open("https://www.linkedin.com/in/animeshbanerjeeee/", "Animesh");
          },
        ),
        NavButton(
          text: "work",
          onPressed: () {
            html.window.open("https://www.linkedin.com/in/animeshbanerjeeee/","Animesh");
          },
        ),
        NavButton(
          text: "contact",
          onPressed: () {
            html.window.open("https://www.linkedin.com/in/animeshbanerjeeee/","Animesh");
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
        ),
        drawer: ResponsiveWidget.isSmallScreen(context)
        ? Drawer(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[],
          ),
        ): null,

        body: SingleChildScrollView(
          child: AnimatedPadding(
            duration: Duration(seconds: 2),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.1),
            child: ResponsiveWidget(
              largeScreen: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  NavHeader(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.1,
                  ),
                  ProfileInfo(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.1,
                  ),
                  SocialInfo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
        ? MainAxisAlignment.center
        : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Animesh(),
          Spacer(),
          if(!ResponsiveWidget.isSmallScreen(context))
            Row(
              children: <Widget>[
        NavButton(
          text: "About",
          onPressed: () {
            html.window.open("https://www.linkedin.com/in/animeshbanerjeeee/", "Animesh");
          },
        ),
        NavButton(
          text: "Work",
          onPressed: () {
            html.window.open("https://www.linkedin.com/in/animeshbanerjeeee/","Animesh");
          },
        ),
        NavButton(
          text: "Contact",
          onPressed: () {
            html.window.open("https://www.linkedin.com/in/animeshbanerjeeee/","Animesh");
          },
        ),
              ],
            ),
        ],
      ),
    );
  }
}
class Animesh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "Animesh",
          textScaleFactor: 2,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

  const NavButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(text),
      borderSide: BorderSide(
        color: color,
      ),
      onPressed: onPressed,
      highlightedBorderColor: color,
    );
  }
}

class ProfileInfo extends StatelessWidget {
  profileImage(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.luminosity,
          color: Colors.orange,
//            borderRadius: BorderRadius.circular(40),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("Animesh1.jpg"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );

  final profileData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Hi there! My name is",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.orange),
      ),
      Text(
        "Animesh\nBanerjee",
        textScaleFactor: 5,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "I am a Final Year student of SRM Institute of Science and Technology \n"
        "Currently pursuing Computer Science and Engineering\n"
        "Web Developer",
        softWrap: true,
        textScaleFactor: 1.5,
        style: TextStyle(color: Colors.white70),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: StadiumBorder(),
            child: Text("Resume"),
            color: Colors.red,
            onPressed: () {
              html.window.open(
                  "https://drive.google.com/open?id=1NJ297GUvRvve7xDpxoNt_cGk78VKun4e",
                  "Resume");
            },
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
            width: 20,
          ),
          OutlineButton(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            shape: StadiumBorder(),
            child: Text("Say Hi!"),
            color: Colors.red,
            onPressed: () {
              html.window.open("https://www.linkedin.com/in/animeshbanerjeeee/", "Animesh");
            },
            padding: EdgeInsets.all(10),
          )
        ],
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[profileImage(context), profileData],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          profileImage(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          profileData
        ],
      ),
    );
  }
}

class SocialInfo extends StatelessWidget {
  List<Widget> socialMediaWidgets() {
    return [
      NavButton(
        text: "Github",
        onPressed: () {
          html.window.open("https://github.com/stant581", "Git");
        },
        color: Colors.blue,
      ),
      NavButton(
        text: "Facebook",
        onPressed: () {
          html.window.open("https://www.facebook.com/profile.php?id=100006763517192", "Fb");
        },
        color: Colors.blue,
      ),
    ];
  }

  Widget copyRightText() => Text(
        "Thank You for stopping by",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: socialMediaWidgets(),
          ),
          copyRightText(),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ...socialMediaWidgets(),
          copyRightText(),
        ],
      ),
    );
  }
}