import 'package:flutter/material.dart';
import 'package:flutter_clubhouse/utils/data.dart';
import 'package:flutter_clubhouse/utils/style.dart';
import 'package:flutter_clubhouse/widgets/round_Image.dart';
import 'package:flutter_clubhouse/widgets/round_button.dart';

class LobbyBottomSheet extends StatefulWidget {
  final Function onButtonTap;

  const LobbyBottomSheet({Key key, this.onButtonTap}) : super(key: key);

  @override
  _LobbyBottomSheetState createState() => _LobbyBottomSheetState();
}

class _LobbyBottomSheetState extends State<LobbyBottomSheet> {
  var selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        right: 10,
        left: 10,
        bottom: 20,
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            alignment: Alignment.centerRight,
            child: Text(
              '+ Add a Topic',
              style: TextStyle(
                color: Style.AccentGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var i = 0, len = 3; i < len; i++)
                Flexible(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      setState(() {
                        selectedButtonIndex = i;
                      });
                    },
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                          color: i == selectedButtonIndex
                              ? Style.SelectedItemGrey
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: i == selectedButtonIndex
                                ? Style.SelectedItemBorderGrey
                                : Colors.transparent,
                          )),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: RoundImage(
                              width: 80,
                              height: 80,
                              borderRadius: 20,
                              path: lobbyBottomSheets[i]['image'],
                            ),
                          ),
                          Text(
                            lobbyBottomSheets[i]['text'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Divider(
            thickness: 1,
            height: 60,
            indent: 20,
            endIndent: 20,
          ),
          Text(
            lobbyBottomSheets[selectedButtonIndex]['selectedMessage'],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RoundButton(
            color: Style.AccentGreen,
            onPressed: widget.onButtonTap,
            text: '🎉 Let\'s go',
          )
        ],
      ),
    );
  }
}
