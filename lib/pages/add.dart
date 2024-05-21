import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/todo_providers.dart/todo_provider.dart';

class AddTodo extends ConsumerWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController addTodoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: addTodoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              TextButton(
                  onPressed: () {
                    ref
                        .read(todoProvider.notifier)
                        .addTodo(addTodoController.text);
                    Navigator.pop(context);
                  },
                  child: const Text("Add Todo"))
            ],
          ),
        ),
      ),
    );
  }
}
