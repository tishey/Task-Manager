import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/provider_locator.dart';
import 'package:task_manager/src/presentation/widget/custom_textfield.dart';
import 'package:task_manager/src/provider/task_model.dart';
import 'package:task_manager/src/util/color.dart';
import 'package:task_manager/src/util/text)style.dart';

class TaskManager extends ConsumerWidget {
  TaskManager({super.key});

  final TextEditingController taskController = TextEditingController();

  // bool isCheck = false;

  // checkToggle() {
  //   setState(() {
  //     isCheck = !isCheck;
  //   });
  // }

  // List<TaskModel> tasks = [];

  // void addTask(String name){
  //  setState(() {
  //    tasks.add(TaskModel(title: name));
  //  });
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  final taskList = TaskModel(isCheck: false, title: taskController.text);
    final taskListProvider = ref.watch(taskProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TASK MANAGER'),
        centerTitle: true,
        backgroundColor: CustomColor.scaffoldBackground,
      ),
      backgroundColor: CustomColor.scaffoldBackground,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: taskListProvider.task.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: CustomColor.scaffoldBackground,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(1, 5),
                            blurRadius: 15,
                            spreadRadius: 2)
                      ]),
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        ref.watch(taskProvider.notifier).checkToggle();
                      },
                      child: AnimatedContainer(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 20,
                        width: 20,
                        // padding: const EdgeInsets.all(2),
                        duration: const Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: taskListProvider.toggleButton
                                    ? Colors.transparent
                                    : Colors.grey),
                            color: taskListProvider.toggleButton
                                ? CustomColor.greenColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.check,
                          color: taskListProvider.toggleButton
                              ? CustomColor.whiteColor
                              : Colors.transparent,
                          size: 15,
                        ),
                      ),
                    ),
                    title: Text(
                      taskListProvider.task[index].title,
                      style: TextTypography.customTextStyle(context).copyWith(
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whiteColor),
                    ),
                  ),
                );
              })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        color: CustomColor.scaffoldBackground,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Expanded(
              child: CustomTextField(
                  hintText: 'Enter task', textController: taskController),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            GestureDetector(
              onTap: () =>
                  ref.watch(taskProvider.notifier).addTask(taskController.text),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: CustomColor.greenColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Text('Add Task',
                    style: TextTypography.customTextStyle(context).copyWith(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whiteColor)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
