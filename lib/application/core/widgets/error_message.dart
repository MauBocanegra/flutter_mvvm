import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget{
  final String errorString;
  const ErrorMessage({
    super.key,
    required this.errorString
  });
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          size: 40,
          color: Colors.redAccent,
        ),
        const SizedBox(height: 20),
        Text(
          errorString,
          style: themeData.textTheme.headline1,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

}