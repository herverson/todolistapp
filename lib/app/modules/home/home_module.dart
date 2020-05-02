import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:todolistapp/app/modules/home/repositories/todo_repository_interface.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'repositories/todo_hasura_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        // Bind<ITodoRepository>((i) => TodoFirebaseRepository(Firestore.instance)),  // UNCOMMENT LINE FOR FIREBASE USE
        Bind<ITodoRepository>((i) => TodoHasuraRepository(i.get())),                  // COMMENT LINE FOR FIREBASE USE
        Bind((i) => HasuraConnect('URL_HASURA')),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
