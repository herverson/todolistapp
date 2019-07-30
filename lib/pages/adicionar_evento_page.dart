import 'package:flutter/material.dart';
import 'package:todolistapp/widgets/butao_custom.dart';

class AdicionarEventoPage extends StatefulWidget {
  @override
  _AdicionarEventoPageState createState() => _AdicionarEventoPageState();
}

class _AdicionarEventoPageState extends State<AdicionarEventoPage> {
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Text(
                  "Adicionar umo novo evento",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  labelText: 'Insira o título'
                ),
              ),
              SizedBox(
                height: 24,

              ),
              _acaoButao(context)
            ],
          ),
        )
      );
  }

  Widget _acaoButao(BuildContext context) {
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
                textCor: Colors.white
              ),
            ],
          );
  }
}
