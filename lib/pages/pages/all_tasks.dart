import 'package:flutter/material.dart';
import 'package:login_tsbbar/data/repository.dart';
import 'package:login_tsbbar/models/task.dart';
import 'package:login_tsbbar/pages/widgets/task_widget.dart';

class AllTasksPage extends StatelessWidget {
  List<Task> tasks;
  Function function;
  Function toggleFun;
  AllTasksPage(this.tasks, this.function, this.toggleFun);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TaskWidget(tasks[index], function, toggleFun);
          }),
    );
  }
}
