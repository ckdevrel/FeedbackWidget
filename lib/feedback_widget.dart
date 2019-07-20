library feedback_widget;
import 'package:flutter/material.dart';

enum Status { LIKE, UNLIKE, AVERAGE }

class FeedbackView extends StatefulWidget {

  IconData negativeIcon, neutralIcon, positiveIcon;
  EdgeInsetsGeometry iconPadding;
  String negativeText, neutralText, positiveText, defaultText;
  double iconSize;
  IconCallback listener;

  FeedbackView({this.negativeIcon, this.neutralIcon, this.positiveIcon,
    this.negativeText, this.neutralText, this.positiveText, this.defaultText,
    this.iconPadding, this.iconSize, @required this.listener});

  @override
  _FeedbackViewState createState() => new _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {

  IconData negativeIcon, neutralIcon, positiveIcon;
  String negativeText, neutralText, positiveText, defaultText;
  Status _status;
  EdgeInsetsGeometry iconPadding;
  double iconSize;
  IconCallback listener;

  @override
  void initState(){
    negativeIcon ??= Icons.thumb_down;
    positiveIcon ??= Icons.thumb_up;
    neutralIcon ??= Icons.thumbs_up_down;
    neutralText ??= "Average";
    positiveText ??= "Good";
    negativeText ??= "Bad";
    defaultText ??= "Rate Me!";
    iconPadding ??= EdgeInsets.all(0);
    iconSize ??= 24.0;
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
            IconView(iconSize, iconPadding, negativeIcon, _status == Status.UNLIKE, Colors.redAccent, Colors.grey.shade400, onPressed: () {
              updateState(Status.UNLIKE);
            }),
            IconView(iconSize, iconPadding, neutralIcon, _status == Status.AVERAGE, Colors.yellow, Colors.grey.shade400, onPressed: () {
              updateState(Status.AVERAGE);
            }),
            IconView(iconSize, iconPadding, positiveIcon, _status == Status.LIKE, Colors.greenAccent, Colors.grey.shade400, onPressed: () {
              updateState(Status.LIKE);
            }),
          ],
        ),
        Text(getComment())
      ],
    );
  }

  void updateState(Status status) {
    setState(() {
      _status = status;
      if (listener != null){
        listener(_status);
      }
    });
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

class IconView extends StatelessWidget {

  double iconSize;
  EdgeInsetsGeometry iconPadding;
  IconData negativeIcon;
  VoidCallback onPressed;
  bool isSelected;
  Color unSelectedColor;
  Color selectedColor;

  IconView(this.iconSize, this.iconPadding, this.negativeIcon,
      this.isSelected, this.selectedColor, this.unSelectedColor, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: iconSize,
      padding: iconPadding,
      icon: Icon(negativeIcon,
          color: isSelected
              ? selectedColor
              : unSelectedColor),
      onPressed: onPressed,
    );
  }
}

typedef IconCallback = void Function(Status status);
