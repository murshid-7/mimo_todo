import 'package:flutter/material.dart';
import 'package:momo_todo_task/model/todo_model.dart';
import 'package:momo_todo_task/services/todo_services.dart';

class TodoProvider with ChangeNotifier {
  final FireStoreServices _firestoreServices = FireStoreServices();
  List<Model> _todos = [];

  List<Model> get todos => _todos;
  Future<void> fetchTodos() async {
    try {
      _firestoreServices.getTodos().listen((List<Model> fetchedTodos) {
        _todos = fetchedTodos;
        notifyListeners();
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addTodo(Model model) async {
    try {
      await _firestoreServices.addTodo(model);
      fetchTodos();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void toggleTodoStatus(int index) {
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }
}
