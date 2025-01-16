import 'dart:ffi';
import 'dart:ui';

import 'package:flutter_foreground_task/utils/color_extension.dart';

/// The button to display in the notification.
class NotificationButton {
  /// Constructs an instance of [NotificationButton].
  const NotificationButton({
    required this.id,
    required this.text,
    this.textColor,
    this.isReply,
  })  : assert(id.length > 0),
        assert(text.length > 0);

  /// The button identifier.
  final String id;

  /// The text to display on the button.
  final String text;

  /// The button text color. (only work Android)
  final Color? textColor;

  final bool? isReply;

  /// Returns the data fields of [NotificationButton] in JSON format.
  Map<String, dynamic> toJson() {
    bool isReplyBool;
    if(isReply == null) {
      isReplyBool = false;
    } else {
      isReplyBool = isReply!;
    }
    return {
      'id': id,
      'text': text,
      'textColorRgb': textColor?.toRgbString,
      'isReply': isReplyBool
    };
  }

  /// Creates a copy of the object replaced with new values.
  NotificationButton copyWith({
    String? id,
    String? text,
    Color? textColor,
  }) =>
      NotificationButton(
        id: id ?? this.id,
        text: text ?? this.text,
        textColor: textColor ?? this.textColor,
      );
}
