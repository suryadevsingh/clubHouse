import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse/utils/history.dart';
import 'package:flutter_clubhouse/utils/style.dart';
import 'package:flutter_clubhouse/widgets/round_button.dart';

import 'phone_Number_Page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle(),
            SizedBox(
              height: 40,
            ),
            Expanded(child: buildContents()),
            buildBottom(context),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      "Welcome!",
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }

  Widget buildContents() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'We\'re working hard to get Clubhouse ready for launch! While we wrap up the finishing touches, we\'re adding people gradually to make sure nothing breaks. :)',
            style: TextStyle(
              height: 1.8,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'If you don\'t yet have an invite, you can reserve your username now and we\'ll get you on very soon. We are so grateful you\'re here and can\'t wait to have you join! 🙏',
            style: TextStyle(
              height: 1.8,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            '🏠 Paul, Rohan & the Clubhouse team',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RoundButton(
          color: Style.AccentBlue,
          onPressed: () {
            History.pushPage(context, PhoneNumberPage());
          },
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Got your username",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Have an invite text?',
              style: TextStyle(
                color: Style.AccentBlue,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Sign in',
              style: TextStyle(
                color: Style.AccentBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.arrow_right_alt,
              color: Style.AccentBlue,
            ),
          ],
        ),
      ],
    );
  }
}
