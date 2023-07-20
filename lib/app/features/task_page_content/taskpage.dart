import 'package:flutter/material.dart';

class TaskPageContent extends StatelessWidget {
  const TaskPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CustomContainer(),
        CustomContainer(),
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(80, 150, 87, 87),
              Color.fromARGB(58, 218, 14, 14)
            ], begin: Alignment.topCenter, end: Alignment.bottomRight),
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(30)),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('tu zrobimy tytuł'),
              Text('tu zrobimy opis pomysłu czy coś'),
            ],
          ),
        ),
      ),
    );
  }
}
