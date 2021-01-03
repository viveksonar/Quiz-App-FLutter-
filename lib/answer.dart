import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  // final int indx;

  Answer(this.selectHandler, this.answerText); //, this.indx);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ButtonTheme(
        minWidth: 180.0,
        height: 50.0,
        child: RaisedButton(
          child: Text(
            answerText,
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () => selectHandler(answerText),
          color: Colors.blue,
        ),
      ),
    );
  }
}
