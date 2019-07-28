import 'package:flutter/material.dart';

class TarefaPage extends StatefulWidget {
  @override
  _TarefaPageState createState() => _TarefaPageState();
}

class Tarefa
{
  final String tarefa;
  final bool isCompleta;
  const Tarefa(this.tarefa, this.isCompleta);
}

final List<Tarefa> _tarefaList = [
  new Tarefa("Ligar para fulano", true),
  new Tarefa("SECOMP", true),
  new Tarefa("Começar os trabalhos", true),
  new Tarefa("Entrga de trabalho", true),
  new Tarefa("Apresentação", true),
  new Tarefa("Academia", false),
];

class _TarefaPageState extends State<TarefaPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: _tarefaList.length,
      itemBuilder: (context, index){
        return 
        _tarefaList[index].isCompleta 
          ? _tarefaCompleta(_tarefaList[index].tarefa)
          : _tarefaIncompleta(_tarefaList[index].tarefa);        
      },
    );
  }

   Widget _tarefaIncompleta(String tarefa) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 24.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.radio_button_unchecked,
            color: Theme.of(context).accentColor,
            size: 20,
          ),
          SizedBox(
            width: 28,
          ),
          Text(tarefa)
        ],
      ),
    );
  }

   Widget _tarefaCompleta(String tarefa) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, bottom: 24.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.radio_button_checked,
            color: Theme.of(context).accentColor,
            size: 20,
          ),
          SizedBox(
            width: 28,
          ),
          Text(tarefa)
        ],
      ),
    );
  }
}

