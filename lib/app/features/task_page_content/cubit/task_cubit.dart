import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit()
      : super(const TaskState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const TaskState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription = FirebaseFirestore.instance
        .collection('task')
        .orderBy('name')
        .snapshots()
        .listen((data) {
      emit(
        TaskState(
          documents: data.docs,
          errorMessage: '',
          isLoading: false,
        ),
      );
    })
      ..onError((error) {
        emit(TaskState(
          documents: const [],
          errorMessage: error.toString(),
          isLoading: false,
        ));
      });
  }

  Future<void> deleteDocument(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('task')
          .doc(documentId)
          .delete();
    } catch (error) {
      emit(state);
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
