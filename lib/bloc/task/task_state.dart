import 'package:meta/meta.dart';
import 'package:zinonline/network/model/task_model.dart';

@immutable
abstract class TaskState {}

class InitialTaskState extends TaskState {}

class LoadingState extends TaskState{}

class LoadedState extends TaskState{
  final List<TaskModel> taskModels;
  LoadedState(this.taskModels);
}

class FailTaskState extends TaskState{
  final String error;
  FailTaskState(this.error);
}