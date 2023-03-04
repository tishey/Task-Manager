import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/provider_locator.dart';
import 'package:task_manager/src/presentation/widget/custom_textfield.dart';
import 'package:task_manager/src/util/color.dart';
import 'package:task_manager/src/util/text)style.dart';

class TaskManager extends ConsumerWidget {
  TaskManager({super.key});

  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListProvider = ref.watch(taskProvider);

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
              itemCount: taskListProvider.length,
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
                        ref.read(taskProvider.notifier).checkToggle(taskListProvider[index], index);
                      },
                      child: AnimatedContainer(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 20,
                        width: 20,
                        // padding: const EdgeInsets.all(2),
                        duration: const Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: taskListProvider[index].isCheck
                                    ? Colors.transparent
                                    : Colors.grey),
                            color: taskListProvider[index].isCheck
                                ? CustomColor.greenColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.check,
                          color: taskListProvider[index].isCheck
                              ? CustomColor.whiteColor
                              : Colors.transparent,
                          size: 15,
                        ),
                      ),
                    ),
                      title: Text(
                      taskListProvider[index].title,
                      style:  TextTypography.customTextStyle(context).copyWith(
                        decoration: taskListProvider[index].isCheck ? TextDecoration.lineThrough : null,
                        fontWeight: FontWeight.bold,
                        color: taskListProvider[index].isCheck ? CustomColor.greyColor : CustomColor.whiteColor),
                    ),
                    trailing: IconButton(
                      splashRadius: 1,
                      onPressed: (){
                     if(taskListProvider.isNotEmpty && index < taskListProvider.length){
                       ref.read(taskProvider.notifier).deleteTask(taskListProvider[index], );
                     }
                    }, icon: Icon(Icons.delete, color: CustomColor.redColor,)),
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
              onTap: () {
                 ref.read(taskProvider.notifier).addTask(taskController.text);
                  taskController.text = '';
              },
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
