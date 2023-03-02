
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/src/provider/task_model.dart';

final taskProvider =
    StateNotifierProvider<TaskNotiferModel, List<TaskModel>>((ref) {
  return TaskNotiferModel([]);
});