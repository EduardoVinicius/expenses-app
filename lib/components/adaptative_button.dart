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
            onPressed: onPressed as Function(),
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(label as String))
        : ElevatedButton(
            onPressed: onPressed as Function(),
            child: Text(
              label as String,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ));
  }
}
