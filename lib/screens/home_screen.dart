import 'package:flutter/material.dart';
import 'package:todoapps/model/todo_model.dart';
import 'package:todoapps/widgets/todo.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  List<ToDoModel> todos = [];
  bool doedit = false;
  void submit(doedit, [ToDoModel? obj]) {
    if (!doedit) {
      todos.add(ToDoModel(title.text, desc.text, false));
      title.clear();
      desc.clear();
      setState(() {});
    } else {
      obj!.title = title.text;
      obj.desc = desc.text;
      setState(() {});
    }
  }

  int globalIndex = 0;
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To Do",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    todos[index].check = !todos[index].check;
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: ToDo(
                          title: todos[index].title,
                          desc: todos[index].desc,
                          done: todos[index].check,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            todos.removeAt(index);
                            setState(() {});
                          },
                          icon: Icon(Icons.delete)),
                      IconButton(
                          onPressed: () {
                            globalIndex = index;
                            title.text = todos[globalIndex].title;
                            desc.text = todos[globalIndex].desc;
                            title.text = todos[globalIndex].title;
                            doedit = true;
                            setState(() {});
                          },
                          icon: Icon(Icons.edit))
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: title,
                        decoration: const InputDecoration(
                          labelText: "Title",
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: desc,
                        decoration: const InputDecoration(
                          labelText: "desc",
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      ToDoModel todo = ToDoModel(title.text, desc.text, false);
                      if (doedit == false) {
                        submit(false, todo);
                      } else {
                        submit(true, todos[globalIndex]);
                      }
                    },
                    child: const Text("Add to_do")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
