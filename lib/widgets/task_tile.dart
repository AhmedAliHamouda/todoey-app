import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String nameTaskAdded;
  final Function onChangeState;
  final Function onLongPress;

  TaskTile({this.isChecked, this.nameTaskAdded, this.onChangeState,this.onLongPress});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        nameTaskAdded,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          fontSize: 18.0,
          //fontWeight: FontWeight.w700,
        ),
      ),

      //TODO:THis checkBoxState it's CallBack Function.
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: onChangeState,
      ),

      //TODO: this CheckBox not CallBack.
      // Checkbox(
      //   value: isChecked,
      //   onChanged: (value) {
      //     setState(() {
      //       isChecked = value;
      //     });
      //   },
      // ),
    );
  }
}
