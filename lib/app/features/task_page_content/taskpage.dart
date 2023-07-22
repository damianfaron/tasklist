import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasklist/app/features/presentation/colors/app_colors.dart';
import 'package:tasklist/app/features/task_page_content/cubit/task_cubit.dart';
import 'package:tasklist/app/features/task_page_content/custom_container.dart';

class TaskPageContent extends StatelessWidget {
  const TaskPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit()..start(),
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return const Center(child: Text('Coś poszło nie tak'));
          }
          if (state.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          }

          final documents = state.documents;

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
                        color: AppColors.redColor,
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
                    // return direction == DismissDirection.endToStart;
                    // okno dialogowe z zapytaniem o usunięcie
                    return await showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: AppColors.mainColor,
                        // title: const Text('Chcesz usunąć ?'),
                        content: const Text(
                          'Czy napewno chcesz usunąć?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: const Text(
                                  'Nie',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: const Text(
                                  'Tak',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  onDismissed: (_) {
                    context.read<TaskCubit>().deleteDocument(document.id);
                  },
                  child: CustomContainer(
                    title: document['name'],
                    description: document['description'],
                  ),
                )
              ],
            ],
          );
        },
      ),
    );
  }
}
