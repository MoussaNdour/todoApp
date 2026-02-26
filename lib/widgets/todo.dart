import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  final String todoName;
  
  const ToDo({
    super.key,
    required this.todoName,
  });

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  bool? isChecked=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(Icons.task),
        title: Text(widget.todoName),
        trailing: Checkbox(
          value: isChecked, 
          tristate: false,
          onChanged: (bool? value) {
            setState(() {
              isChecked=value;
            });
            
          },
        ),
      ),
    );
  }
}