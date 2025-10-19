import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/model.dart';
import '../service/database_local.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  List<Data> tasks = [];

  Future<void> loadTasks() async {
    emit(AppLoading());
    try {
      final tasks = await getData();
      emit(AppLoaded(tasks));
    } catch (e) {
      emit(AppError(e.toString()));
    }
  }

  Future<void> addTask(Data task) async {
    try {
      await insertValue(task);
      await loadTasks();
    } catch (e) {
      emit(AppError(e.toString()));
    }
  }

  Future<void> removeTask(int? id) async {

    try {
      await remove(id!);
      tasks = await getData();
      emit(AppLoaded(tasks));
    } catch (e) {
      emit(AppError(e.toString()));
    }
  }
}
