import 'package:flutter/material.dart';

import '../manger/model.dart';

class TaskBottomSheet extends StatefulWidget {
  final Function(Data) onSave;
  const TaskBottomSheet({super.key, required this.onSave});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text('Input', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
          SizedBox(height: 10),
          TextFormField(
            controller: idController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'ID',
              labelStyle: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.numbers, color: Colors.orange),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Title',
              labelStyle: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color:Colors.black),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.title, color: Colors.orange),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: timeController,
            decoration: InputDecoration(
              labelText: 'Time',
              labelStyle: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.access_time, color: Colors.orange),
            ),
          ),
          SizedBox(height: 70),
          Container(
            height:90,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                final newTask = Data(
                  id: int.tryParse(idController.text),
                  title: titleController.text,
                  time: timeController.text,
                  status: 'new', data: '2.30',
                );

                widget.onSave(newTask);
                Navigator.pop(context);
              },
              child: Center(child: Text('Save', style: TextStyle(color: Colors.white))),
            )
          ),
        ],
      ),
    );
  }
}