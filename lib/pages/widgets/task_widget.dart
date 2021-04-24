import 'package:flutter/material.dart';
import 'package:login_tsbbar/data/repository.dart';
import 'package:login_tsbbar/models/task.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  Function function;
  Function toggleFun;
  TaskWidget(this.task, this.function, this.toggleFun);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: task.isComplete ? Colors.greenAccent : Colors.redAccent,
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.description),
        leading: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              function(task);
            }),
        trailing: Checkbox(
            value: task.isComplete,
            onChanged: (value) {
              toggleFun(task);
            }),
      ),
    );
  }
}
