
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/src/provider/task_model.dart';

final taskProvider = StateNotifierProvider((ref){
  return TaskNotiferModel(TaskModel(isCheck: false, title: ''));
});