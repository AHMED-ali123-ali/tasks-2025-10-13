import '../model/model.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class AppLoading extends AppState {}

class AppLoaded extends AppState {
  final List<Data> tasks;
  AppLoaded(this.tasks);
}

class AppError extends AppState {
  final String message;
  AppError(this.message);
}