
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';

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
  void dispose() {
    idController.dispose();
    titleController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Add Task',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title, color: Colors.orange),
              ),
            ),
            const SizedBox(height: 10),
      TextFormField(
        readOnly: true,
        controller: timeController,
        decoration: const InputDecoration(
          labelText: "Select Time",
          border: OutlineInputBorder(),
          suffixIcon: Icon(
            Icons.access_time_filled,
            color: Colors.blue,
            size: 30,
          ),
        ),
        onTap: () async {
          showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          ).then((onValue) {
            if (onValue != null) {
              timeController.text =
                  "${onValue.hour}:${onValue.minute} ${onValue.period.name}"
                      .toString();
            }
          });
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter task time";
          }
          return null;
        },
      ),
        const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  final newTask = Data(
                    id: int.tryParse(idController.text),
                    title: titleController.text,
                    time: timeController.text,
                    status: 'new',
                    data: '2.30',
                  );
                  widget.onSave(newTask);
                  Navigator.pop(context);
                },
                style:
                ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}