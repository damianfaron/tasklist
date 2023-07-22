import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(const AddState(errorMessage: ''));

  Future<void> add(String taskName, String descriptionTask) async {
    try {
      emit(const AddState(errorMessage: ''));
      await FirebaseFirestore.instance.collection('task').add(
        {
          'name': taskName,
          'description': descriptionTask,
        },
      );
      emit(const AddState(errorMessage: ''));
    } catch (error) {
      emit(
        AddState(errorMessage: error.toString()),
      );
    }
  }
}
