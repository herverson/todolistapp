import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String labelTexto;

  const TextFieldCustom({Key key, this.labelTexto}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          labelText: labelTexto
        ),
      
    );
  }
}