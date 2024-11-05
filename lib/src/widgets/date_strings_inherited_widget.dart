import 'package:flutter/material.dart';

/// Class to hold custom date strings that can be overridden
class CustomDateStrings {
  final String today;
  final String yesterday;
  
  const CustomDateStrings({
    this.today = "Today",
    this.yesterday = "Yesterday",
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomDateStrings &&
          runtimeType == other.runtimeType &&
          today == other.today &&
          yesterday == other.yesterday;

  @override
  int get hashCode => today.hashCode ^ yesterday.hashCode;
}

/// Inherited widget to pass custom date strings down the widget tree
class DateStringsInheritedWidget extends InheritedWidget {
  final CustomDateStrings dateStrings;
  
  const DateStringsInheritedWidget({
    super.key,
    required this.dateStrings,
    required super.child,
  });
  
  /// Get the current [DateStringsInheritedWidget] instance from context
  static DateStringsInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DateStringsInheritedWidget>();
  }
  
  @override
  bool updateShouldNotify(DateStringsInheritedWidget oldWidget) {
    return dateStrings != oldWidget.dateStrings;
  }
}
