import 'package:flutter/material.dart';
import 'style.dart';

class TodoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TodoPageUI();
  }
}

class TodoPageUI extends State<TodoPage>{
  List TodoList=[];
  String item="";

  MyInputField(content){
    setState(() {
      item = content;
    });
  }
  AddItem(){
    setState(() {
      TodoList.add({"item":item});

    });
  }
  RemoveItem(index){
    setState(() {
      TodoList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Todo App'),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 70,
                        child: TextFormField(onChanged:(content){MyInputField(content);},decoration: AppInputField('Add New Item List'),)
                    ),
                    Expanded(
                        flex: 20,
                        child: Padding(
                          padding: EdgeInsets.only(left: 7),
                          child: ElevatedButton(
                          style: AppButtonStyle(),
                          onPressed: (){AddItem();},
                          child: Text('Add'),
                        ),
                        ),
                    )
                  ],
                )
            ),
            Expanded(
              flex: 90,
                child: ListView.builder(
                  itemCount: TodoList.length,
                    itemBuilder: (context,index){
                      return Card(
                        child:SizedBox50(
                          Row(
                            children: [
                              Expanded(
                                  flex: 90,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(TodoList[index]['item'].toString()),
                                  )
                              ),
                              Expanded(
                                  flex: 10,
                                  child: TextButton(
                                    onPressed: (){RemoveItem(index);},
                                    child: Icon(Icons.delete),

                                  )
                              )
                            ],
                          ),
                        ),
                      );
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}