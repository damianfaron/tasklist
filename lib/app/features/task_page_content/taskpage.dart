import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskPageContent extends StatelessWidget {
  const TaskPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('task').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // print('Error fetching data: ${snapshot.error}');
            return const Center(child: Text('Coś poszło nie tak'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('trwa ładowanie'));
          }

          final documents = snapshot.data!.docs;
          return ListView(
            children: [
              for (final document in documents) ...[
                CustomContainer(
                  title: document['name'],
                  description: document['description'],
                )
                // Text(document['name']),
                // Text(document['description']),
              ],
              const Center(
                child: Text('jeden'),
              )
            ],
          );
        });
  }
}


// kontenerek 
class CustomContainer extends StatelessWidget {
  const CustomContainer({
    required this.description,
    required this.title,
    super.key,
  });

  final String title;
  final String description;

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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
