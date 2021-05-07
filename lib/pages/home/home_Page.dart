import 'package:flutter/material.dart';
import 'package:flutter_clubhouse/pages/lobby/follower_Page.dart';
import 'package:flutter_clubhouse/pages/lobby/lobby_Page.dart';
import 'package:flutter_clubhouse/utils/data.dart';
import 'package:flutter_clubhouse/utils/history.dart';

import 'profile_Page.dart';
import 'widgets/home_App_Bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HomeAppBar(
          profile: myProfile,
          onProfileTab: () {
            History.pushPage(
                context,
                ProfilePage(
                  profile: myProfile,
                ));
          },
        ),
      ),
      body: PageView(
        children: [
          LobbyPage(),
          FollowerPage(),
        ],
      ),
    );
  }
}
