
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:momo_todo_task/controller/theme_controller.dart';
import 'package:momo_todo_task/controller/todo_controller.dart';
import 'package:momo_todo_task/view/add-category/add_category.dart';
import 'package:momo_todo_task/view/authentication/forgot_password/forgot_password.dart';
import 'package:momo_todo_task/view/authentication/login.dart';
import 'package:momo_todo_task/view/authentication/register/register.dart';
import 'package:momo_todo_task/view/home/homescreen.dart';
import 'package:momo_todo_task/view/settings/settings.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeController()),
        ChangeNotifierProvider(create: (context) => TodoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(),
        routes: {
          '/register': (context) => RegisterScreen(),
          '/login': (context) => LoginScreen(),
          '/forget': (context) => ForgotPassword(),
          '/home': (context) => HomeScreen(),
          '/addtask': (context) => AddCategory(),
          '/settings': (context) => SettingsPage(),
        },
      ),
    );
  }
}
