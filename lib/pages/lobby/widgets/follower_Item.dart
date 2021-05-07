import 'package:flutter/material.dart';
import 'package:flutter_clubhouse/models/User.dart';
import 'package:flutter_clubhouse/utils/style.dart';
import 'package:flutter_clubhouse/widgets/round_Image.dart';
import 'package:flutter_clubhouse/widgets/round_button.dart';

class FollowerItem extends StatelessWidget {
  final User user;
  final Function onProfileTap;
  final Function onRoomButtonTap;

  const FollowerItem(
      {Key key, this.user, this.onProfileTap, this.onRoomButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onProfileTap,
          child: RoundImage(
            path: user.profileImage,
            borderRadius: 15,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${user.lastAccessTime}',
                style: TextStyle(
                  color: Style.DarkBrown,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 25,
          child: RoundButton(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            onPressed: onRoomButtonTap,
            color: Style.LightGreen,
            child: Row(
              children: [
                Text(
                  '+ Room',
                  style: TextStyle(
                    color: Style.AccentGreen,
                  ),
                ),
                Icon(
                  Icons.lock,
                  color: Style.AccentGreen,
                  size: 15,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
