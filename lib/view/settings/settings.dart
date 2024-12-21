import 'package:flutter/material.dart';
import 'package:momo_todo_task/controller/theme_controller.dart';
import 'package:momo_todo_task/services/auth_services.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeController>(context);
    final AuthServices authServices = AuthServices();
    return Scaffold(
      backgroundColor: themeProvider.backgroundColor,
      appBar: AppBar(
        backgroundColor: themeProvider.backgroundColor,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
            color: themeProvider.textColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: themeProvider.backgroundColor,
                  backgroundImage: AssetImage(
                    'assets/photo-1642886513531-5a1cf3ba164a.jpeg',
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Murshid',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.textColor,
                      ),
                    ),
                    Text(
                      'Flutter Developer',
                      style: TextStyle(
                        fontSize: 14,
                        color: themeProvider.textColor,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.edit, color: themeProvider.textColor),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Welcome back again murshid,',
              style: TextStyle(
                fontSize: 16,
                color: themeProvider.textColor,
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              leading:
                  Icon(Icons.notifications, color: themeProvider.textColor),
              title: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.textColor,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: themeProvider.textColor,
              ),
              title: Text(
                'General',
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.textColor,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info, color: themeProvider.textColor),
              title: Text(
                'About',
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.textColor,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.dark_mode, color: themeProvider.textColor),
              title: Text(
                'Dark / Light',
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.textColor,
                ),
              ),
              onTap: () {
                themeProvider.changeTheme();
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: themeProvider.textColor),
              title: Text(
                'Log out',
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.textColor,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            authServices.logoutUser();
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('No'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
