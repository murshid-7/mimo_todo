import 'package:flutter/material.dart';
import 'package:momo_todo_task/controller/theme_controller.dart';
import 'package:provider/provider.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
 final List<Map<String, dynamic>> tasks = [
  {
    'header': 'Monday',
    'items': [
      {'title': 'Morning Yoga', 'done': true},
      {'title': 'Walk 5 Km', 'done': false}
    ]
  },
  {
    'header': 'Next Week',
    'items': [
      {'title': 'Complete 30 Push-ups', 'done': true},
      {'title': 'Cycle for 1 hour', 'done': false},
      {'title': 'Jog for 20 minutes', 'done': false}
    ]
  },
  {
    'header': 'March 2024 Goals',
    'items': [
      {'title': 'Run 10 Km', 'done': false},
      {'title': 'Complete 100 Push-ups in a row', 'done': false},
      {'title': 'Attend Yoga Classes thrice a week', 'done': false}
    ]
  },
  {
    'header': 'Next Month',
    'items': [
      {'title': 'Join Gym', 'done': true},
      {'title': 'Start Swimming', 'done': false},
      {'title': 'Lose 5 Kg', 'done': false}
    ]
  },
];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeController>(context);
    return Scaffold(
      backgroundColor: themeProvider.backgroundColor,
      appBar: AppBar(
        backgroundColor: themeProvider.backgroundColor,
        title: Text('Sport', style: TextStyle(color: themeProvider.textColor)),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: themeProvider.textColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final section = tasks[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  section['header'],
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.textColor),
                ),
              ),
              ...section['items'].map<Widget>((item) {
                return ListTile(
                  leading: IconButton(
                    icon: Icon(
                      item['done']
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: item['done'] ? Colors.green : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        item['done'] = !item['done'];
                      });
                    },
                  ),
                  title: Text(
                    item['title'],
                    style: TextStyle(color: themeProvider.textColor),
                  ),
                );
              }).toList(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: themeProvider.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                content: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Type your task...',
                            border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.grey),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: themeProvider.addButtonColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: themeProvider.buttonColor,
      ),
    );
  }
}
