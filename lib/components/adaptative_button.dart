import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String? label;
  final Function? onPressed;

  AdaptativeButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: onPressed as Function(), child: Text(label as String))
        : ElevatedButton(
            style: ButtonStyle(colo),
            onPressed: onPressed as Function(),
            child: Text(
              label as String,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ));
  }
}
