import 'package:flutter/material.dart';
import 'butao_custom.dart';

class CustomModalActionButton extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onSave;

  CustomModalActionButton({@required this.onClose, @required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ButaoCustom(
          onPressed: onClose,
          textButao: "Fechar",
        ),
        ButaoCustom(
          onPressed: onSave,
          textButao: "Salvar",
          cor: Color.fromRGBO(250, 30, 78, 1),
          textCor: Colors.white,
        )
      ],
    );
  }
}