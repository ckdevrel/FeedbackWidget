# feedback_widget

A new Flutter package project for feedback view.

## How to use?

### Default
<a href="https://imgur.com/SC3x5hB"><img src="https://i.imgur.com/SC3x5hB.png" title="source: imgur.com" /></a>

```dart
FeedbackView(listener: (Status status) {},);
```

### Custom Size and Padding
<a href="https://imgur.com/WiMtMW5"><img src="https://i.imgur.com/WiMtMW5.png" title="source: imgur.com" /></a>

```dart
FeedbackView(
    iconSize: 48,
    iconPadding: EdgeInsets.all(16),
    listener: (Status status) {},
);
```

### Custom Icon and Text
<a href="https://imgur.com/KObD4Y5"><img src="https://i.imgur.com/KObD4Y5.png" title="source: imgur.com" /></a>

```dart
FeedbackView(
    iconSize: 48,
    iconPadding: EdgeInsets.all(16),
    listener: (Status status) {},
    negativeIcon: Icons.flight_takeoff,
    neutralIcon: Icons.flight,
    positiveIcon: Icons.flight_land,
    negativeText: 'Take off',
    neutralText: 'Stable',
    positiveText: 'Landing',
    defaultText: 'Flight Status',
);
```
## Use this package as a library

1. Depend on it
Add this to your package's pubspec.yaml file:
```dart
dependencies:
  feedback_widget: ^0.0.6
```

2. Install it
You can install packages from the command line:
with Flutter:
```dart
$ flutter pub get
```

Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.
3. Import it
Now in your Dart code, you can use:
```dart
import 'package:feedback_widget/feedback_widget.dart';
```
