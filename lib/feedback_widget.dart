library feedback_widget;
import 'package:flutter/material.dart';

enum Status { LIKE, UNLIKE, AVERAGE }

class FeedbackView extends StatefulWidget {
  IconData negativeIcon, neutralIcon, positiveIcon;

  String negativeText, neutralText, positiveText, defaultText;

  FeedbackView({this.negativeIcon, this.neutralIcon, this.positiveIcon,
    this.negativeText, this.neutralText, this.positiveText, this.defaultText});

  @override
  _FeedbackViewState createState() => new _FeedbackViewState(negativeIcon, neutralIcon, positiveIcon,
      negativeText, neutralText, positiveText, defaultText);

}

class _FeedbackViewState extends State<FeedbackView> {

  IconData negativeIcon, neutralIcon, positiveIcon;

  String negativeText, neutralText, positiveText, defaultText;

  Status _status;

  _FeedbackViewState([this.negativeIcon, this.neutralIcon, this.positiveIcon,
    this.negativeText, this.neutralText, this.positiveText, this.defaultText]);

  @override
  void initState(){
    negativeIcon ??= Icons.thumb_down;
    positiveIcon ??= Icons.thumb_up;
    neutralIcon ??= Icons.thumbs_up_down;
    neutralText ??= "Average";
    positiveText ??= "Good";
    negativeText ??= "Bad";
    defaultText ??= "Rate Me!";
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(negativeIcon,
                  color: (_status == Status.UNLIKE)
                      ? Colors.redAccent
                      : Colors.grey.shade400),
              onPressed: () {
                setState(() {
                  _status = Status.UNLIKE;
                });
              },
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(neutralIcon,
                  color: (_status == Status.AVERAGE)
                      ? Colors.yellow
                      : Colors.grey.shade400),
              onPressed: () {
                setState(() {
                  _status = Status.AVERAGE;
                });
              },
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(positiveIcon,
                  color: (_status == Status.LIKE)
                      ? Colors.greenAccent
                      : Colors.grey.shade400),
              onPressed: () {
                setState(() {
                  _status = Status.LIKE;
                });
              },
            )
          ],
        ),
        Text(getComment())
      ],
    );
  }

  String getComment() {
    switch (_status) {
      case Status.UNLIKE:
        return negativeText;
      case Status.LIKE:
        return positiveText;
      case Status.AVERAGE:
        return neutralText;
    }
    return defaultText;
  }
}
