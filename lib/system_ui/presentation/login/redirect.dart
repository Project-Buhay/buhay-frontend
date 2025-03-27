import 'package:flutter/material.dart';

class Redirect extends StatefulWidget {
  const Redirect({super.key, this.message});

  final message;

  @override
  State<Redirect> createState() => _RedirectState();
}

class _RedirectState extends State<Redirect> {

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Page not Available"),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text("${widget.message}", style: TextStyle(fontSize: 24), textAlign: TextAlign.center,))
          ],
        ),
      ),
    );
  }

}