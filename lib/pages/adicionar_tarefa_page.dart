import 'package:flutter/material.dart';
import 'package:todolistapp/widgets/butao_custom.dart';
import 'package:todolistapp/widgets/textfield_custom.dart';

class AdicionarTarefaPage extends StatefulWidget {
  @override
  _AdicionarTarefaPageState createState() => _AdicionarTarefaPageState();
}

class _AdicionarTarefaPageState extends State<AdicionarTarefaPage> {
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Text(
                "Adicionar uma nova tarefa",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            TextFieldCustom(labelTexto: 'Insira o título'),
            SizedBox(
              height: 24,
            ),
            _acaoButao(context)
          ],
        ),
      );
  }

  Row _acaoButao(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ButaoCustom(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                textButao: "Fechar",
              ),
              ButaoCustom(
                onPressed: () {},
                textButao: "Salvar",
                cor: Color.fromRGBO(250, 30, 78, 1),
                textCor: Colors.white,
              ),
            ],
          );
  }
}