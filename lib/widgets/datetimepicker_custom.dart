import 'package:flutter/material.dart';

class CustomDateTimePicker extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String valor;

  CustomDateTimePicker(
      {@required this.onPressed, @required this.icon, @required this.valor});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Theme.of(context).accentColor, size: 30),
            SizedBox(
              width: 12,
            ),
            Text(
              valor,
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}