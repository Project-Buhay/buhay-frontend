import 'package:flutter/material.dart';

class ErrorDialogBox extends StatefulWidget {
  const ErrorDialogBox({super.key, this.error_code, this.message});

  final error_code;
  final message;

  @override
  State<ErrorDialogBox> createState() => _ErrorDialogBoxState();
}

class _ErrorDialogBoxState extends State<ErrorDialogBox> {

@override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("${widget.error_code}"),
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