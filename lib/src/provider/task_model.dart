
//  import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskModel{
   String title;
   bool isCheck;

   TaskModel({required this.isCheck, required this.title});
 }

 class TaskNotiferModel extends StateNotifier<TaskModel>{
  TaskNotiferModel(super.state);

  List<TaskModel> task = [];

  addTask(String name){
    task.add(TaskModel(title: name, isCheck: false));
  }
  
  bool toggleButton = false;

  checkToggle(){
   toggleButton =! toggleButton;
    }
   
 }
  

  


// class TaskListNotifier extends StateNotifier<List<TaskModel>>{
//   TaskListNotifier() : super([]);



  
//   addTask(TaskModel task){
//     state = [...state, task];
//   }
  
// }