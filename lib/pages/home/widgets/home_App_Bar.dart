import 'package:flutter/material.dart';
import 'package:flutter_clubhouse/models/User.dart';
import 'package:flutter_clubhouse/widgets/round_Image.dart';

class HomeAppBar extends StatelessWidget {
  final User profile;
  final Function onProfileTab;

  const HomeAppBar({Key key, this.profile, this.onProfileTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: Icon(Icons.search),
          ),
        ),
        Spacer(),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              iconSize: 30,
              icon: Icon(Icons.mail),
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {},
              iconSize: 30,
              icon: Icon(Icons.calendar_today),
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {},
              iconSize: 30,
              icon: Icon(Icons.notifications_active_outlined),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: onProfileTab,
              child: RoundImage(
                path: profile.profileImage,
                width: 40,
                height: 40,
              ),
            )
          ],
        ),
      ],
    );
  }
}
