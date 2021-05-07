import 'package:flutter/material.dart';
import 'package:flutter_clubhouse/models/room.dart';
import 'package:flutter_clubhouse/pages/room/room_Page.dart';
import 'package:flutter_clubhouse/utils/data.dart';
import 'package:flutter_clubhouse/utils/style.dart';
import 'package:flutter_clubhouse/widgets/round_button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/lobby_bottom_sheet.dart';
import 'widgets/room_Card.dart';
import 'widgets/schedule_Card.dart';


class LobbyPage extends StatefulWidget {
  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SmartRefresher(
          enablePullDown: true,
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            padding: const EdgeInsets.only(
              bottom: 80,
              left: 20,
              right: 20,
            ),
            itemBuilder: (lc, index) {
              if (index == 0) {
                return buildScheduleCard();
              }

              return buildRoomCard(rooms[index - 1]);
            },
            itemCount: rooms.length + 1,
          ),
        ),
        buildGradientContainer(),
        buildStartRoomButton(),
      ],
    );
  }

  Widget buildScheduleCard() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ScheduleCard(),
    );
  }

  Widget buildRoomCard(Room room) {
    return GestureDetector(
      onTap: () {
        enterRoom(room);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: RoomCard(
          room: room,
        ),
      ),
    );
  }

  Widget buildGradientContainer() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Style.LightBrown.withOpacity(0.2),
          Style.LightBrown,
        ],
      )),
    );
  }

  Widget buildStartRoomButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: RoundButton(
          onPressed: () {
            showBottomSheet();
          },
          color: Style.AccentGreen,
          text: '+ Start a room'),
    );
  }

  enterRoom(Room room) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (rc) {
        return RoomPage(
          room: room,
        );
      },
    );
  }

  showBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      builder: (context) {
        return Wrap(
          children: [
            LobbyBottomSheet(
              onButtonTap: () {
                Navigator.pop(context);

                enterRoom(
                  Room(
                    title: '${myProfile.name}\'s Room',
                    users: [myProfile],
                    speakerCount: 1,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
