import 'package:flutter/material.dart';

class EventoPage extends StatefulWidget {
  @override
  _EventoPageState createState() => _EventoPageState();
}

class Evento
{
  final String tempo;
  final String tarefa;
  final String desc;
  final bool isCompleta;

  const Evento(this.tempo, this.tarefa, this.desc, this.isCompleta);
  
}

final List<Evento> _eventoList = [
  new Evento("10:00", "Ligar para fulano", "lista1", true),
  new Evento("08:00", "SECOMP", "lista1", true),
  new Evento("09:30", "Começar os trabalhos", "lista1", true),
  new Evento("10:10", "Entrega de trabalho", "lista1", false),
  new Evento("11:40", "Apresentação", "lista1", false),
  new Evento("12:00", "Academia", "lista1", false),
];

class _EventoPageState extends State<EventoPage> {
  @override
  Widget build(BuildContext context) {
    double iconTamanho = 20;
    return ListView.builder(
      itemCount: _eventoList.length,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24),
          child: Row(
            children: <Widget>[
            Container(
              decoration: IconDecoration(
                iconTamanho: iconTamanho,
                linhaWidth: 1,
                primeiroData: index == 0 ?? true,
                ultimoData: index == _eventoList.length - 1 ?? true
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 3),
                      color: Color(0x20000000),
                      blurRadius: 5
                    )
                  ]
                ),
                
                child: Icon(
                  _eventoList[index].isCompleta
                    ? Icons.fiber_manual_record
                    : Icons.radio_button_unchecked,
                  size: iconTamanho,
                  color: Color.fromRGBO(250, 30, 78, 1),
                ),
              )
            ),
            Container(
              width: 80, 
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(_eventoList[index].tempo, style: TextStyle(fontSize: 20.0),),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x20000000),
                        blurRadius: 5,
                        offset: Offset(0, 3)
                      ),
                    ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_eventoList[index].tarefa, style: TextStyle(fontSize: 20.0),),
                      SizedBox(
                        height: 12,
                      ),
                      Text(_eventoList[index].desc)
                    ],
                  )
                )
              )
            )
          ],
        )
      );
      }
    );
  }
}

class IconDecoration extends Decoration
{
  final double iconTamanho;
  final double linhaWidth;
  final bool primeiroData;
  final bool ultimoData;

  IconDecoration(
    {
      @required double iconTamanho,
      @required double linhaWidth,
      @required bool primeiroData,
      @required bool ultimoData,
    }
  ) : this.iconTamanho = iconTamanho,
      this.linhaWidth = linhaWidth,
      this.primeiroData = primeiroData, 
      this.ultimoData = ultimoData;

  @override
  BoxPainter createBoxPainter([onChanged]) {
    // TODO: implement createBoxPainter
    return IconLinha(
      iconTamanho: iconTamanho,
      linhaWidth: linhaWidth,
      primeiroData: primeiroData,
      ultimoData: ultimoData
    );
  }
}

class IconLinha extends BoxPainter
{
  final double iconTamanho;
  final bool primeiroData;
  final bool ultimoData;
  final Paint paintLinha;
  IconLinha(
    {
      @required double iconTamanho,
      @required double linhaWidth,
      @required bool primeiroData,
      @required bool ultimoData,
    }
  ) : this.iconTamanho = iconTamanho,
      this.primeiroData = primeiroData, 
      this.ultimoData = ultimoData,
      paintLinha = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = linhaWidth
      ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final leftOffset = Offset((iconTamanho / 2) + 24, offset.dy);
    final double iconSpace = iconTamanho / 1.5;

    final Offset topo = configuration.size.topLeft(Offset(leftOffset.dx, 0.0));

    final Offset centroTop = configuration.size.centerLeft(Offset(leftOffset.dx, leftOffset.dy - iconSpace));

    final Offset centroBottom = configuration.size.centerLeft(Offset(leftOffset.dx, leftOffset.dy + iconSpace));

    final Offset end = configuration.size.bottomLeft(Offset(leftOffset.dx, leftOffset.dy * 2));

    if (!primeiroData) canvas.drawLine(topo, centroTop, paintLinha);
    if (!ultimoData) canvas.drawLine(centroBottom, end, paintLinha);



  }
}