import 'package:flutter/material.dart';
import 'package:meeting_scheduler/home/account_menu.dart';
import 'package:meeting_scheduler/home/main_calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        actions: const [AccountMenu()],
      ),
      body: const MainCalendar(),
    ));
  }
}
