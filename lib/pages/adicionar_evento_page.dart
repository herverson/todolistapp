import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolistapp/widgets/butao_custom.dart';
import 'package:todolistapp/widgets/textfield_custom.dart';

class AdicionarEventoPage extends StatefulWidget {
  @override
  _AdicionarEventoPageState createState() => _AdicionarEventoPageState();
}

class _AdicionarEventoPageState extends State<AdicionarEventoPage> {
  String _selecionarData = 'Escolher data';
  String _selecionarTempo = 'Escolher a hora';

  Future _pegarData() async {
    DateTime pickdata = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().add(Duration(days: -365)),
      lastDate: DateTime.now().add(Duration(days: 360)),
      builder: (context, child) {
          return SingleChildScrollView(
            child: Theme(
              child: child,
              data: ThemeData.dark(),
            ),
          );
      }
    );
    if (pickdata != null) setState(() {
      _selecionarData = pickdata.toString(); 
    });
  }

  Future _pegarTempo() async {
    TimeOfDay picktime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
          return SingleChildScrollView(
            child: Theme(
              child: child,
              data: ThemeData.dark(),
            ),
          );
      }
    );
    if (picktime != null) setState(() {
      _selecionarTempo = picktime.toString(); 
    });
  }

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
              TextFieldCustom(labelTexto: 'Insira o título'),
              SizedBox(height: 12,),
              TextFieldCustom(labelTexto: 'Insira a descrição'),
              SizedBox(height: 12,),
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: _pegarData,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.date_range,
                       color: Theme.of(context).accentColor, size: 30,),
                      SizedBox(width: 12,),
                      Text(
                        _selecionarData,
                        style: TextStyle(fontSize: 14),
                      )
                  ],
                ),

                  
              ),
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: _pegarTempo,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                       color: Theme.of(context).accentColor, size: 30,),
                      SizedBox(width: 12,),
                      Text(
                        _selecionarTempo,
                        style: TextStyle(fontSize: 14),
                      )
                  ],
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
