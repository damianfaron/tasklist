import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasklist/app/features/add_page_content/add_page.dart';
import 'package:tasklist/app/features/add_page_content/cubit/add_cubit.dart';
import 'package:tasklist/app/features/presentation/colors/app_colors.dart';
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
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Builder(
          builder: (context) {
            if (currentIndex == 1) {
              return const Center(
                child: Text(
                  'Dodaj zadanie',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            }
            if (currentIndex == 2) {
              return const Center(
                child: Text(
                  'Twój profil',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            }
            return const Center(
              child: Text(
                'Lista Zadań',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => AddCubit(),
        child: Builder(
          builder: (context) {
            if (currentIndex == 1) {
              return AddPageContent(
                onSave: () {
                  setState(
                    () {
                      currentIndex = 0;
                    },
                  );
                },
              );
            }
            if (currentIndex == 2) {
              return const UserPageContent();
            }
            return const TaskPageContent();
          },
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.navColor3,
        buttonBackgroundColor: AppColors.navColor2,
        color: AppColors.mainColor,
        height: 50,
        items: const [
          Icon(
            Icons.home,
          ),
          Icon(
            Icons.add,
          ),
          Icon(
            Icons.person_2_outlined,
          ),
        ],
        animationDuration: const Duration(milliseconds: 200),
        index: currentIndex,
        onTap: (newIndex) {
          setState(
            () {
              currentIndex = newIndex;
            },
          );
        },
      ),
    );
  }
}
