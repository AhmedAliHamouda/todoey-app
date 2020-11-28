import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';
import 'package:todoey_app/widgets/task_tile.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void alertDialogShow(int indexTask) {
      Alert(
        context: context,
        type: AlertType.warning,
        title: 'Remove Task',
        desc: 'Are you Sure To Remove This Task',
        buttons: [
          DialogButton(
            child: Text(
              "YES",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              Provider.of<TaskData>(context, listen: false)
                  .deleteTask(indexTask);
            },
            color: Color.fromRGBO(0, 179, 134, 1.0),
          ),
          DialogButton(
            child: Text(
              "NO",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ]),
          )
        ],
      ).show();
    }

    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.tasksCount,
            itemBuilder: (context, index) {
              final task = taskData.tasksAdded[index];
              return TaskTile(
                nameTaskAdded: task.nameTask,
                isChecked: task.isDone,
                onChangeState: (checkValue) {
                  taskData.updateTask(task);
                },
                onLongPress: () {
                  alertDialogShow(index);
                  //taskData.deleteTask(index);
                },
              );
            });
      },
    );
  }
}
