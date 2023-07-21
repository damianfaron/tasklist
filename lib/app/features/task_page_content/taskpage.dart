import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tasklist/app/features/presentation/colors/app_colors.dart';

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

          if (documents.isEmpty) {
            return const Center(
              child: Text(
                'Nie dodałeś zadania. Przejdź poniżej do zakładki dodaj, aby dodać i wyświetlić zadania na ekranie.',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w100),
              ),
            );
          }
          return ListView(
            children: [
              for (final document in documents) ...[
                Dismissible(
                  key: ValueKey(document.id),
                  background: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Icon(Icons.delete),
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    //możesz usunąć tylko przez swipe od prawej do lewej
                    return direction == DismissDirection.endToStart;
                  },
                  onDismissed: (_) {
                    FirebaseFirestore.instance
                        .collection('task')
                        .doc(document.id)
                        .delete();
                  },
                  child: CustomContainer(
                    title: document['name'],
                    description: document['description'],
                  ),
                )
              ],
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
            AppColors.navColor,
            AppColors.navColor2,
          ], begin: Alignment.topCenter, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black, width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                // rozciągnij tekst opisu
                // textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
