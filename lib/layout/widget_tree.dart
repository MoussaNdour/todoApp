import 'package:flutter/material.dart';
import 'package:todo/data/notifier.dart';
import 'package:todo/screens/account.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/widgets/navigationbar.dart';
import 'package:todo/widgets/todo.dart';

List<Widget> screens=[
  Home(),
  Account()
];



class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentScreen,
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Your to do List"),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              openDialog(context);
          },),
          bottomNavigationBar: NavigationBarWidget(),
          body: screens.elementAt(value),
        );
      }
    );
  }
}

void openDialog(BuildContext context) {

  TextEditingController controller=TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirmation"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder()
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: (){
              if(controller.text.isNotEmpty){
                ToDo todo = ToDo(todoName: controller.text);

                todos.value = [...todos.value, todo];

                Navigator.of(context).pop();
              }
            }, 
            child: Text("Add")
          ),
          
        ],
      );
    },
  );
}