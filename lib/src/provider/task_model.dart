
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskModel {
  String title;
  bool isCheck;
  TaskModel({required this.isCheck, required this.title});
}

class TaskNotiferModel extends StateNotifier<List<TaskModel>> {
  TaskNotiferModel(super.state);

  addTask(String name) {
    state = [...state, TaskModel(title: name, isCheck: false)];
  }

  checkToggle(TaskModel taskModel, index) {
    var hold = state.toList();
    hold.insert(
        index, TaskModel(isCheck: !taskModel.isCheck, title: taskModel.title));
    hold.remove(taskModel);
    state = [...hold];
  }

  deleteTask(TaskModel task){
   var delete = state.toList();
   
   delete.remove(task);
  }
}
