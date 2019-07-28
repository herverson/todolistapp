import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todolistapp/pages/evento_page.dart';
import 'package:todolistapp/pages/tarefa_page.dart';

 void main() => runApp(MyApp());

 class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodoList Herver',
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: "IndieFlower"),
      home: MyHomePage(),
    );
  }
}

 class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

 class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 35,
            color: Color.fromRGBO(250, 30, 78, 1)
          ),
          Positioned(
            right: 0,
            child: Text(
              "28",
              style: TextStyle(fontSize: 150, color: Color(0x10000000)),
            ),
          ),
          _contentPrincipal(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(250, 30, 78, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

   Column _contentPrincipal(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            "Domingo",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: _butao(context),
        ),
        Expanded(child: EventoPage())
      ],
    );
  }

  

   Widget _butao(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            color: Color.fromRGBO(250, 30, 78, 1),
            textColor: Colors.white,
            padding: const EdgeInsets.all(14.0),
            child: Text("Tarefas"),
          ),
        ),
        SizedBox(
          width: 32,
        ),
        Expanded(
          child: MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).accentColor),
                borderRadius: BorderRadius.circular(12)),
            color: Color.fromRGBO(250, 30, 78, 1),
            textColor: Colors.white,
            padding: const EdgeInsets.all(14.0),
            child: Text("Eventos"),
          ),
        ),
      ],
    );
  }
}