import 'package:flutter/material.dart';
import 'package:momo_todo_task/controller/theme_controller.dart';
import 'package:momo_todo_task/controller/todo_controller.dart';
import 'package:momo_todo_task/model/todo_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TodoProvider>(context, listen: false).fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeController>(context);
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(
            color: themeProvider.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: themeProvider.backgroundColor,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
            child: CircleAvatar(
              radius: 22,
              backgroundImage:
                  AssetImage('assets/photo-1642886513531-5a1cf3ba164a.jpeg'),
              backgroundColor: themeProvider.backgroundColor,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: themeProvider.textColor,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeProvider.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        'assets/Slavoj-Zizek-1024x585.jpg.webp',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '"The memories is a shield and life helper."',
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: themeProvider.textColor,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Tamim Al-Barghouti',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: themeProvider.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0), 
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.3,
                ),
                itemCount: todoProvider.todos.isEmpty
                    ? 1
                    : todoProvider.todos.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return AddTodoCard(themeProvider, todoProvider);
                  }
                  final category = todoProvider.todos[index - 1];
                  return CategoryCard(category, themeProvider);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget AddTodoCard(ThemeController themeProvider, TodoProvider todoProvider) {
    return Card(
      color: themeProvider.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Center(
        child: IconButton(
          onPressed: () {
            final TextEditingController titleController = TextEditingController();
            final TextEditingController tasksController = TextEditingController();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: themeProvider.backgroundColor,
                  title: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        color: themeProvider.textColor,
                      ),
                    ),
                  ),
                  content: TextField(
                    controller: tasksController,
                    decoration: InputDecoration(
                      hintText: 'Tasks',
                      hintStyle: TextStyle(
                        color: themeProvider.textColor,
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        if (titleController.text.isNotEmpty &&
                            tasksController.text.isNotEmpty) {
                          todoProvider.addTodo(
                            Model(
                              title: titleController.text,
                              tasks: tasksController.text,
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Add"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                );
              },
            );
          },
          icon: Icon(
            Icons.add_circle_rounded,
            color: themeProvider.addButtonColor,
            size: 50,
          ),
        ),
      ),
    );
  }

  Widget CategoryCard(Model category, ThemeController themeProvider) {
    return Card(
      color: themeProvider.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/addtask');
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.textColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                category.tasks,
                style: TextStyle(
                  fontSize: 14,
                  color: themeProvider.textColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: themeProvider.textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
