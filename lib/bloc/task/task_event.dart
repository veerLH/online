import 'package:meta/meta.dart';

@immutable
abstract class TaskEvent {}

class GetTaskEvent extends TaskEvent{}
