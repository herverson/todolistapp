import 'package:flutter/material.dart';

class ButaoCustom extends StatelessWidget {
  final VoidCallback onPressed;
  final String textButao;
  final Color cor;
  final Color textCor;
  final Color bordaCor;

  const ButaoCustom(
    {
      @required this.onPressed, 
      @required this.textButao, 
      this.cor, 
      this.textCor, 
      this.bordaCor = Colors.transparent
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: bordaCor),
          borderRadius: BorderRadius.circular(12)),
      color: cor,
      textColor: textCor,
      padding: const EdgeInsets.all(14.0),
      child: Text(textButao),
    );
  }
}