import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasklist/app/features/add_page_content/cubit/add_cubit.dart';

class AddPageContent extends StatefulWidget {
  const AddPageContent({
    required this.onSave,
    super.key,
  });

  final Function onSave;

  @override
  State<AddPageContent> createState() => _AddPageContentState();
}

class _AddPageContentState extends State<AddPageContent> {
  var taskName = '';
  var descriptionTask = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (newValue) {
              setState(() {
                taskName = newValue;
              });
            },
            maxLines: null,
            decoration: InputDecoration(
              labelText: 'Nazwa zadania',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 3,
                  color: Color.fromARGB(80, 150, 87, 87),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (newValue) {
              setState(() {
                descriptionTask = newValue;
              });
            },
            maxLines: null,
            decoration: InputDecoration(
              labelText: 'Opis zadania',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 3,
                  color: Color.fromARGB(80, 150, 87, 87),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          // TextField(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(80, 150, 87, 87),
            )),
            onPressed: taskName.isEmpty || descriptionTask.isEmpty
                ? null
                : () {
                    context.read<AddCubit>().add(taskName, descriptionTask);
                    // FirebaseFirestore.instance.collection('task').add({
                    //   'name': taskName,
                    //   'description': descriptionTask,
                    // });
                    widget.onSave();
                  },
            child: const Text(
              'Dodaj',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
