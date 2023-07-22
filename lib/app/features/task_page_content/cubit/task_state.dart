part of 'task_cubit.dart';

@immutable
class TaskState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;

  final String errorMessage;

  const TaskState({
    required this.documents,
    required this.errorMessage,
    required this.isLoading,
  });
}
