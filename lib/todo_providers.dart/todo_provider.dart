import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo_model.dart';

final todoProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  void addTodo(String content) {
    state = [
      ...state,
      Todo(
        content: content,
        isCompleted: false,
        todoId: state.isEmpty ? 0 : state[state.length - 1].todoId + 1,
      ),
    ];
  }

  void completetodo(int id) {
    state = [
      for (final todo in state)
        if (todo.todoId == id)
          Todo(content: todo.content, isCompleted: true, todoId: todo.todoId)
        else
          todo
    ];
  }

  void deleteTodo(int id) {
    state = state.where((todo) => todo.todoId != id).toList();
  }
}
