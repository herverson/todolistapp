
class TodoModel {
  String title;
  bool check;
  int id;

  TodoModel({this.title = '', this.check = false, this.id});

  factory TodoModel.fromJson(Map doc) {
    return TodoModel(title: doc['title'], check: doc['check'], id: doc['id']);
  }

}