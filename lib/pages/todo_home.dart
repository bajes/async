import 'package:flutter/material.dart';
import 'package:login_tsbbar/data/repository.dart';
import 'package:login_tsbbar/models/task.dart';
import 'package:login_tsbbar/pages/pages/all_tasks.dart';
import 'package:login_tsbbar/pages/pages/complete_tasks.dart';
import 'package:login_tsbbar/pages/pages/inComplete_tasks.dart';

class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  PageController pageController = PageController(initialPage: 0);

  int currentIndex = 0;
  void deleteTask(Task task) {
    Repository.tasks.remove(task);
    setState(() {});
  }

  void toggleTask(Task task) {
    int taskIndex = Repository.tasks.indexOf(task);
    task.isComplete = !task.isComplete;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks Home'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(
                  Icons.list,
                  color: currentIndex == 0 ? Colors.blue : Colors.black,
                ),
                onPressed: () {
                  pageController.jumpToPage(0);
                  currentIndex = 0;
                }),
            IconButton(
                icon: Icon(
                  Icons.done,
                  color: currentIndex == 1 ? Colors.blue : Colors.black,
                ),
                onPressed: () {
                  pageController.jumpToPage(1);
                  currentIndex = 1;
                }),
            IconButton(
                icon: Icon(
                  Icons.close,
                  color: currentIndex == 2 ? Colors.blue : Colors.black,
                ),
                onPressed: () {
                  pageController.jumpToPage(2);
                  currentIndex = 2;
                })
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {},
        children: [
          AllTasksPage(Repository.tasks, deleteTask, toggleTask),
          CompleteTasksPage(Repository.tasks, deleteTask, toggleTask),
          InCompleteTasksPage(Repository.tasks, deleteTask, toggleTask)
        ],
      ),
    );
  }
}
