import 'package:flutter/material.dart';
import 'package:tasklist/app/features/add_page_content/add_page.dart';
import 'package:tasklist/app/features/task_page_content/taskpage.dart';
import 'package:tasklist/app/features/user_page_content/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(builder: (context) {
          if (currentIndex == 1) {
            return const Center(
                child: Text(
              'Dodaj zadanie',
              style: TextStyle(fontWeight: FontWeight.bold),
            ));
          }
          if (currentIndex == 2) {
            return const Center(
                child: Text(
              'Twój profil',
              style: TextStyle(fontWeight: FontWeight.bold),
            ));
          }
          return const Center(
              child: Text(
            'Lista Zadań',
            style: TextStyle(fontWeight: FontWeight.bold),
          ));
        }),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 1) {
          return const AddPageContent();
        }
        if (currentIndex == 2) {
          return const UserPageContent();
        }
        return const TaskPageContent();
      }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (newValue) {
            setState(() {
              currentIndex = newValue;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Strona Główna',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Dodaj',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profil',
            )
          ]),
    );
  }
}
