import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  final String title;
  final String desc;
  final bool done;

  const ToDo(
      {super.key, required this.title, required this.desc, required this.done});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              //  color: widget.done == true ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                Text(widget.desc)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
