import 'package:flutter/material.dart';

class ErrorDialogBox extends StatefulWidget {
  const ErrorDialogBox({super.key, this.errorCode, this.message});

  final errorCode;
  final message;

  @override
  State<ErrorDialogBox> createState() => _ErrorDialogBoxState();
}

class _ErrorDialogBoxState extends State<ErrorDialogBox> {

@override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("${widget.errorCode}"),
      content: Text('${widget.message}'),
      actions: <Widget>[
        TextButton(
          child: Text('Exit'),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
  }

}