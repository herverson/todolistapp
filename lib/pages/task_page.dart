import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolistapp/app/modules/home/home_controller.dart';
import 'package:todolistapp/app/modules/home/models/todo_model.dart';
import 'package:todolistapp/widgets/custom_button.dart';
import 'package:todolistapp/widgets/custom_modal_action_button.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  @override
  Widget build(BuildContext context) {
    final controller =  Modular.get<HomeController>();

    return Observer(
        builder: (_) {
          if (controller.todoList.hasError) {
            return Center(
              child: RaisedButton(
                onPressed: controller.getList, 
                child: Text('Erro ao carregar tarefas'),
              )
            );
          }

          if (controller.todoList.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<TodoModel> list = controller.todoList.data;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              TodoModel model = list[index];
              return model.check
                        ? _taskComplete(model)
                        : _taskUncomplete(model);
            }
          );
        }
    );
  }

  Widget _taskUncomplete(TodoModel data) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Editar tarefa",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          initialValue: data.title,
                          onChanged: (value) => data.title = value,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Título'
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        // Text(new DateFormat("dd-MM-yyyy").format(data.date)),
                        SizedBox(
                          height: 24,
                        ),
                        CustomModalActionButton(
                          onClose: () {
                            Navigator.of(context).pop();
                          },
                          onSave: () async{
                            await Modular.get<HomeController>().save(data);
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Deletar tarefa",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(
                          height: 24,
                        ),
                        Text(data.title),
                        SizedBox(
                          height: 24,
                        ),
                        // Text(new DateFormat("dd-MM-yyyy").format(data.date)),
                        SizedBox(
                          height: 24,
                        ),
                        CustomButton(
                          buttonText: "Deletar",
                          onPressed: () {
                            Modular.get<HomeController>().delete(data);
                            Navigator.of(context).pop();
                          },
                          color: Color.fromRGBO(250, 30, 78, 1),
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      child: Row(
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            iconSize: 20.0,
            icon: Icon(Icons.radio_button_unchecked),
            color: Color.fromRGBO(250, 30, 78, 1),
            onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Confirmar tarefa",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(
                          height: 24,
                        ),
                        Text(data.title),
                        SizedBox(
                          height: 24,
                        ),
                        // Text(new DateFormat("dd-MM-yyyy").format(data.date)),
                        SizedBox(
                          height: 24,
                        ),
                        CustomButton(
                          buttonText: "Completa",
                          onPressed: () {
                            data.check = true;
                            Modular.get<HomeController>().save(data);
                            Navigator.of(context).pop();
                          },
                          color: Color.fromRGBO(250, 30, 78, 1),
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
          Text(
            data.title,
            style: TextStyle(fontSize: 20.0),
          )
        ],
      ),
    );
  }

  Widget _taskComplete(TodoModel data) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Editar tarefa",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          initialValue: data.title,
                          onChanged: (value) => data.title = value,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Título'
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        // Text(new DateFormat("dd-MM-yyyy").format(data.date)),
                        SizedBox(
                          height: 24,
                        ),
                        CustomModalActionButton(
                          onClose: () {
                            Navigator.of(context).pop();
                          },
                          onSave: () async{
                            await Modular.get<HomeController>().save(data);
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Deletar tarefa",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(
                          height: 24,
                        ),
                        Text(data.title),
                        SizedBox(
                          height: 24,
                        ),
                        // Text(new DateFormat("dd-MM-yyyy").format(data.date)),
                        SizedBox(
                          height: 24,
                        ),
                        CustomButton(
                          buttonText: "Deletar",
                          onPressed: () {
                            Modular.get<HomeController>().delete(data);
                            Navigator.of(context).pop();
                          },
                          color: Color.fromRGBO(250, 30, 78, 1),
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      child: Row(
        children: <Widget>[
              IconButton(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                icon: Icon(Icons.check_box),
                color: Color.fromRGBO(250, 30, 78, 1),
                iconSize: 20, 
                onPressed: () =>
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12))),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text("Desmarcar tarefa",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 16)),
                                SizedBox(
                                  height: 24,
                                ),
                                Text(data.title),
                                SizedBox(
                                  height: 24,
                                ),
                                // Text(new DateFormat("dd-MM-yyyy").format(data.date)),
                                SizedBox(
                                  height: 24,
                                ),
                                CustomButton(
                                  buttonText: "Desmarcar",
                                  onPressed: () {
                                    data.check = false;
                                    Modular.get<HomeController>().save(data);
                                    Navigator.of(context).pop();
                                  },
                                  color: Color.fromRGBO(250, 30, 78, 1),
                                  textColor: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Text(
                data.title,
                style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 20.0),
              )
            ],
          ),
    );
  }
}
